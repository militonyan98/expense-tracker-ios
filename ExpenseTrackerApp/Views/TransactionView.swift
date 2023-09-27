//
//  TransactionView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.6.23..
//

import SwiftUI

struct TransactionView: View {
    //@ObservedObject var transactionVM : TransactionViewModel
    //var index : Int
    var transaction: TransactionModel
    
    var amountString: String {
        let initial = transaction.type == .income ? "+ $" : "- $"
        let formatedAmount = String(format: "\(initial)%.2f", transaction.amount)

        return formatedAmount
    }

    var titleString : String {
        print(transaction.title)
        return transaction.title
    }

    var body: some View {
        HStack(alignment: .top, spacing: 2) {
            Spacer()
            ZStack {
                Circle().fill(Color(transaction.category.icon?.color ?? UIColor.cyan).opacity(0.2))
                Image(systemName: transaction.category.icon?.image ?? "signature")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color(transaction.category.icon?.color ?? UIColor.cyan))
            }
            .frame(width: 40, height: 40)
            .padding(.trailing)

            VStack(alignment: .leading, spacing: 10) {
                Text(titleString + "\n")
                    .lineLimit(2)
                    .fontWeight(.semibold)


                Text(transaction.date, format: .dateTime.hour().minute().day().month())
                    .font(.caption)
            }
            .frame(width: 110)

            Spacer()
            Spacer()
            //Divider()

            Text(amountString)
                .fontWeight(.semibold)
//                .scaledToFill()
//                .minimumScaleFactor(0.5)
//                .lineLimit(1)
                .foregroundColor(transaction.type == .income ? .green : .red)

            Spacer()
        }
        .padding([.top, .bottom], 25)
        .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(LinearGradient(gradient: Gradient(colors: [.purple, .indigo, .cyan]), startPoint: .leading, endPoint: .trailing), lineWidth: 1.8)
            )
//        .padding([.leading, .trailing], 2)
    }
}

struct TransactionsListView: View {
    @EnvironmentObject var transactionVM: TransactionViewModel
    @State var givenCategory: CategoryModel?
    @State private var goToEdit = false
    
    @State var transactionID: UUID?
    
//    func printTitle(title: String) -> Bool {
//        print(title)
//        return true
//    }
    
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
//            ForEach(transactionVM.transactions, id: \.id) { transaction in
//                if transaction.category.name == givenCategory?.name || givenCategory == nil {
//                    ZStack {
//                        NavigationLink(destination: DetailsView(transaction: transaction)) {
//                            EmptyView()
//                        }
//                        .frame(width: 0)
//                        .opacity(0)
//
//                        TransactionView(transaction: transaction)
//                            .swipeActions(allowsFullSwipe: false) {
//                                Button {
//                                    transactionVM.removeBy(id: transaction.id)
//                                } label: {
//                                    Label("Delete", systemImage: "trash.fill")
//                                }
//                                .tint(.red)
//
//                                Button {
//                                    goToEdit.toggle()
//                                    transactionID = transaction.id
//                                } label: {
//                                    Label("Edit", systemImage: "pencil")
//                                }
//                                .tint(.yellow)
//                            }
//                            .id(transaction.id)
//                    }
//
//                }
//            }
            .onDelete(perform: transactionVM.remove)
            .listRowSeparator(.hidden)
        }
        .navigationTitle(givenCategory?.name.rawValue.uppercased() ?? "")
        .scrollContentBackground(.hidden)
        .sheet(isPresented: $goToEdit) {
            EditView(transactionID: $transactionID)
        }
        .onAppear {
            print("fetch")
            transactionVM.fetchTransactionData()
        }
    }
}



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

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
    }
}
