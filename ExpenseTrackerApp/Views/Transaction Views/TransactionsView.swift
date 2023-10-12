//
//  TransactionsView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.10.23..
//

import SwiftUI

struct TransactionsView: View {
    @EnvironmentObject var transactionVM: TransactionViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Sort", selection: $transactionVM.sortType) {
                    ForEach(SortType.allCases, id: \.id) {
                        if $0 == .alphabetical {
                            Image(systemName: "textformat.abc")
                                .tag($0)
                        } else if $0 == .date {
                            Text("Date".lowercased())
                                .tag($0)
                        } else if $0 == .amountAscending {
                            Image(systemName: "arrow.up")
                                .tag($0)
                        } else if $0 == .amountDescending {
                            Image(systemName: "arrow.down")
                                .tag($0)
                        }
                    }
                }
                .pickerStyle(.segmented)
                .padding([.leading, .trailing])
                
                TransactionsListView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Transactions".uppercased())
                                .font(.title2)
                                .fontWeight(.medium)
                                .tracking(5)
                                .foregroundColor(.blue.opacity(0.85))
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: AddView(fromTransactions: true)) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.cyan)
                            }
                        }
                    }
            }
            .searchable(text: $transactionVM.searchText)
        }
        
        .navigationBarBackButtonHidden(true)
    }
        
}

#Preview {
    TransactionsView()
}
