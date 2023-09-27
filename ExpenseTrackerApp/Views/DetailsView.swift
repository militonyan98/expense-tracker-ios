//
//  DetailsView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 20.8.23..
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let transaction: TransactionModel
    
    var body: some View {
        NavigationView {
            Form {
                Section("Title") {
                    Text(transaction.title)
                        .bold()
                }
                
                Section("Category") {
//                    HStack {
//                        ZStack {
//                            Circle().fill(Color(transaction.category.icon?.color ?? UIColor.cyan).opacity(0.2))
//                            Image(systemName: transaction.category.icon?.image ?? "signature")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 15, height: 15)
//                                .foregroundColor(Color(transaction.category.icon?.color ?? UIColor.cyan))
//                        }
//                        .frame(width: 27, height: 27)
                        
                        Text(transaction.category.name.rawValue.uppercased())
//                            .foregroundColor(Color(transaction.category.icon?.color ?? UIColor.cyan))
//                    }
                }
                
                Section("Details") {
                    Text((String(format: "$%.2f", transaction.amount)))
                    
//                    HStack {
                        Text(transaction.type.rawValue.uppercased())
                            .foregroundColor(transaction.type == .income ? .green : .red)
                        
//                        Image(systemName: transaction.type == .income ? "arrow.down.backward" : "arrow.up.right")
//                            .frame(width: 15, height: 15)
//                            .foregroundColor(transaction.type == .income ? .green : .red)
//                    }
                }
                
                Section("Date") {
                    Text(transaction.date, format: .dateTime.hour().minute().day().month().year())
                }
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Transaction Details".uppercased())
                    .font(.headline)
                    .foregroundColor(.indigo)
            }
            
            ToolbarItem(placement: .cancellationAction) {
                Button(role: .cancel) {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack(spacing: 0) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.cyan)
                        
                        Text("Back")
                            .foregroundColor(.cyan)
                            .font(.body)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView(transaction: TransactionModel.sampleTransaction)
//    }
//}
