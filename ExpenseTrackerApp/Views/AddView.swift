//
//  AddView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 9.5.23..
//

import SwiftUI

struct AddView: View {
    @State private var category: Category = Category.bills
    @State private var title: String = ""
    @State private var transactionType: TransactionType = TransactionType.income
    @State private var amount: Double?
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section("Title") {
                    TextField("Transaction title", text: $title)
                }
                
                Section("Choose category") {
                    Picker("Category", selection: $category) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue.uppercased())
                                .fontWeight(.medium)
                                .tag(category)
                        }
                    }
                    //.pickerStyle(.wheel)
                    //.frame(height: 150)
                }
                
                
                Section("Details") {
                    Picker("Transaction type", selection: $transactionType) {
                        ForEach(TransactionType.allCases) { type in
                            Text(type.rawValue.uppercased())
                                .tag(type)
                        }
                    }
                    
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                         Text("Cancel")
                            .foregroundColor(.orange)
                            .font(.body)
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        // Save action
                    } label: {
                        Text("Save")
                            .foregroundColor(.cyan)
                            .font(.body)
                    }
                }
            }
        }.navigationBarBackButtonHidden()
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
