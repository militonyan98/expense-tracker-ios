//
//  TransactionView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.6.23..
//

import SwiftUI

struct TransactionView: View {
    var transaction: TransactionModel
    
    var amountString: String {
        let initial = transaction.type == .income ? "+ \(Locale.current.currencySymbol!)" : "- \(Locale.current.currencySymbol!)"
        let formatedAmount = String(format: "\(initial)%.2f", transaction.amount)

        return formatedAmount
    }

    var titleString : String {
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

            Text(amountString)
                .fontWeight(.semibold)
                .foregroundColor(transaction.type == .income ? .green : .red)

            Spacer()
        }
        .padding([.top, .bottom], 25)
        .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(LinearGradient(gradient: Gradient(colors: [.purple, .indigo, .cyan]), startPoint: .leading, endPoint: .trailing), lineWidth: 1.8)
            )
    }
}



struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
    }
}
