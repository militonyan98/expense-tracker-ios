//
//  TransactionDetailsView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.10.23..
//

import SwiftUI

struct TransactionDetailsView: View {
    var transactionType: TransactionType
    var amount: String
    
    var body: some View {
        HStack {
            Image(systemName: transactionType == .income ? "arrow.down.backward" : "arrow.up.right")
                .frame(width: 1, height: 1)
                .foregroundColor(transactionType == .income ? .green : .red)
                .padding()
                .background(.white)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 5) {
                Text(transactionType == .income ? "Income".uppercased() : "Expense".uppercased())
                    .font(.caption)
                    .bold()
                
                Text(amount)
                    .fontWeight(.semibold)
            }
        }
    }
}

//#Preview {
//    TransactionDetailsView()
//}
