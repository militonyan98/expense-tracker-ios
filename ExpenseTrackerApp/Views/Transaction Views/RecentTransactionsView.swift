//
//  RecentTransactionsView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.10.23..
//

import SwiftUI

struct RecentTransactionsView: View {
    @EnvironmentObject var transactionVM: TransactionViewModel
    @State private var goToEdit = false
    @State var transactionID: UUID?
    
    var body: some View {
            List {
                ForEach(transactionVM.filteredTransactions.count > 10 ? transactionVM.filteredTransactions[0..<10].indices : transactionVM.filteredTransactions.indices , id: \.self) { id in
                    ZStack {
                        NavigationLink(destination: DetailsView(transaction: transactionVM.filteredTransactions[id])) {
                            EmptyView()
                        }
                        .frame(width: 0)
                        .opacity(0)
                        
                        TransactionView(transaction: transactionVM.filteredTransactions[id])
                            .swipeActions(allowsFullSwipe: false) {
                                Button {
                                    transactionVM.removeBy(id: transactionVM.filteredTransactions[id].id)
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                                .tint(.red)
                                
                                Button {
                                    goToEdit.toggle()
                                    transactionID = transactionVM.filteredTransactions[id].id
                                } label: {
                                    Label("Edit", systemImage: "pencil")
                                }
                                .tint(.yellow)
                            }
                            .id(transactionVM.filteredTransactions[id].id)
                    }
                    
                    
                }
                .onDelete(perform: transactionVM.remove)
                .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)
            .sheet(isPresented: $goToEdit) {
                EditView(transactionID: $transactionID)
            }
            .onAppear {
                transactionVM.fetchTransactionData()
            }
    }
}

#Preview {
    RecentTransactionsView()
}
