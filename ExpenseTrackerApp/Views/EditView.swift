//
//  EditView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 14.8.23..
//

import SwiftUI

struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var transactionVM: TransactionViewModel
    
    @State private var category: Categories = Categories.bills
    @State private var title: String = ""
    @State private var transactionType: TransactionType = TransactionType.expense
    @State private var amount: Float?
    @State private var date: Date?
    
    @Binding var transactionID: UUID?
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("Transaction title", text: $title)
                        .limitInputLength(value: $title, length: 24)
                }
                
                Section("Choose category") {
                    Picker("Category", selection: $category) {
                        ForEach(Categories.allCases) { category in
                            Text(category.rawValue.uppercased())
                                .fontWeight(.medium)
                                .tag(category)
                        }
                    }
                }
                
                Section("Details") {
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.numberPad)
                    
                    Picker("Transaction type", selection: $transactionType) {
                        ForEach(TransactionType.allCases) { type in
                            Text(type.rawValue.uppercased())
                                .tag(type)
                        }
                    }
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Edit the transaction".uppercased())
                        .font(.headline)
                        .foregroundColor(.indigo)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .cancel) {
                        title = ""
                        category = Categories.bills
                        transactionType = TransactionType.income
                        amount = nil
                        
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.orange)
                            .font(.body)
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        transactionVM.update(transaction: TransactionModel(id: transactionID!, title: title, category: CategoryModel(name: category), type: transactionType, amount: amount!, date: date!))
//
                        title = ""
                        category = Categories.bills
                        transactionType = TransactionType.income
                        amount = nil
                        
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        //NavigationLink(destination: TransactionsView()) {
                            Text("Save")
                                .foregroundColor((title.isEmpty || amount == nil) ? .gray : .cyan)
                                .font(.body)
                        //}
                    }
                    .disabled(title.isEmpty || amount == nil)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            let transactionModel = transactionVM.find(transaction: transactionID!)
            category = transactionModel?.category.name ?? Categories.bills
            title = transactionModel?.title ?? ""
            transactionType = transactionModel?.type ?? TransactionType.expense
            amount = transactionModel?.amount ?? 0.0
            date = transactionModel?.date ?? Date.now
            
//            transactionVM.update(transaction: transactionID!, title: title, amount: amount!, date: date!, category: nil)
        }
    }
}

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView()
//    }
//}
