//
//  CurrentBalanceView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.10.23..
//

import SwiftUI

struct CurrentBalanceView: View {
    @EnvironmentObject var transactionVM: TransactionViewModel
    
    var balance: Float {
        var sumIncomes: Float = 0.0
        var sumExpenses: Float = 0.0
        var finalBalance: Float = 0.0
        
        for i in 0..<transactionVM.transactions.count {
            if transactionVM.transactions[i].type == .income {
                sumIncomes += transactionVM.transactions[i].amount
            } else {
                sumExpenses += transactionVM.transactions[i].amount
            }
        }
        
        finalBalance = sumIncomes - sumExpenses
        
        return finalBalance
    }
    
    var balanceString: String {
        var actualBalance = balance
        if actualBalance < 0 {
            actualBalance = abs(actualBalance)
        }
        
        let formatedAmount = String(format: "%.2f", actualBalance)
        
        if balance < 0 {
            return "-" + "\(Locale.current.currencySymbol!)" + formatedAmount
        } else {
            return "\(Locale.current.currencySymbol!)" + formatedAmount
        }
    }
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Current Balance:".uppercased())
                .font(.system(size: 10, design: .monospaced))
                .fontWeight(.bold)
                .tracking(2)
                .foregroundColor(.white.opacity(0.5))
            
            Text(balanceString)
                .font(.system(size: 35))
                .bold()
            
            Text(Date.now, format: .dateTime.day().month().year())
                .font(.system(size: 13))
                .fontWeight(.medium)
                .foregroundColor(.white.opacity(0.9))
        }
        .padding()
    }
}

#Preview {
    CurrentBalanceView()
}
