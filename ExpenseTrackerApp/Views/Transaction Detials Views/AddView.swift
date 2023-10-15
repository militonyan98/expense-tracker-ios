//
//  AddView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 9.5.23..
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var transactionVM: TransactionViewModel
    
    @State private var category: Categories = Categories.bills
    @State private var title: String = ""
    @State private var transactionType: TransactionType = TransactionType.expense
    @State private var amount: Float?
    
    var fromTransactions: Bool? = false
    
    var body: some View {
        NavigationView {
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
                    Text("Add a transaction".uppercased())
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
                        destination()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        transactionVM.add(transaction: TransactionModel(id: UUID(), title: title, category: CategoryModel(name: Categories(rawValue: category.rawValue) ?? Categories.bills, icon: nil), type: transactionType, amount: amount!, date: Date()))

                        title = ""
                        category = Categories.bills
                        transactionType = TransactionType.income
                        amount = nil
                        
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                            .foregroundColor((title.isEmpty || amount == nil) ? .gray : .cyan)
                            .font(.body)
                    }
                    .disabled(title.isEmpty || amount == nil)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    func destination() -> AnyView {
        if fromTransactions! {
            return AnyView (
                Text("Cancel")
                    .foregroundColor(.orange)
                    .font(.body)
            )
        }
        
        return AnyView (
            Text("Reset")
                .foregroundColor(.orange)
                .font(.body)
        )
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
