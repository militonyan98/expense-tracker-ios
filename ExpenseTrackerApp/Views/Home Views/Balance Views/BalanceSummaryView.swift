//
//  BalanceSummaryView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.10.23..
//

import SwiftUI

struct BalanceSummaryView: View {
    @EnvironmentObject var transactionVM: TransactionViewModel
    
    var incomes: Float {
        var sum: Float = 0.0
        
        for i in 0..<transactionVM.transactions.count {
            if transactionVM.transactions[i].type == .income {
                sum += transactionVM.transactions[i].amount
            }
        }
        
        return sum
    }
    
    var expenses: Float {
        var sum: Float = 0.0
        
        for i in 0..<transactionVM.transactions.count {
            if transactionVM.transactions[i].type == .expense {
                sum += transactionVM.transactions[i].amount
            }
        }
        
        return sum
    }
    
    var incomesString: String {
        let formatedAmount = String(format: "%.2f", incomes)
        
        return "\(Locale.current.currencySymbol!)" + formatedAmount
    }
    
    var expensesString: String {
        let formatedAmount = String(format: "%.2f", expenses)
        
        return "\(Locale.current.currencySymbol!)" + formatedAmount
    }
    
    var body: some View {
        VStack(spacing: 10) {
            CurrentBalanceView()
                .padding(.bottom, 10)
            
            HStack {
                Spacer()
                VStack {
                    TransactionDetailsView(transactionType: .income, amount: incomesString)
                }
                Spacer()
                Spacer()
                VStack {
                    TransactionDetailsView(transactionType: .expense, amount: expensesString)
                }
                Spacer()
            }
        }
        .foregroundColor(.white)
        
    }
}

#Preview {
    BalanceSummaryView()
}
