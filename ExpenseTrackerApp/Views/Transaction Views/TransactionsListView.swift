//
//  TransactionsListView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.10.23..
//

import SwiftUI

struct TransactionsListView: View {
    @EnvironmentObject var transactionVM: TransactionViewModel
    @State var givenCategory: CategoryModel?
    @State private var goToEdit = false
    @State var transactionID: UUID?
    
    var body: some View {
        List {
            ForEach(transactionVM.sortedTransactions.indices, id: \.self) { id in
                if transactionVM.sortedTransactions[id].category.name == givenCategory?.name || givenCategory == nil {
                    ZStack {
                        NavigationLink(destination: DetailsView(transaction: transactionVM.sortedTransactions[id])) {
                            EmptyView()
                        }
                        .frame(width: 0)
                        .opacity(0)
                        
                        TransactionView(transaction: transactionVM.sortedTransactions[id])
                            .swipeActions(allowsFullSwipe: false) {
                                Button {
                                    transactionVM.removeBy(id: transactionVM.sortedTransactions[id].id)
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                                .tint(.red)

                                Button {
                                    goToEdit.toggle()
                                    transactionID = transactionVM.sortedTransactions[id].id
                                } label: {
                                    Label("Edit", systemImage: "pencil")
                                }
                                .tint(.yellow)
                            }
                            .id(transactionVM.sortedTransactions[id].id)
                    }
                   
                }
            }
            .onDelete(perform: transactionVM.remove)
            .listRowSeparator(.hidden)
        }
        .navigationTitle(givenCategory?.name.rawValue.uppercased() ?? "")
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
    TransactionsListView()
}
