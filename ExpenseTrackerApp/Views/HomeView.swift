//
//  HomeView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 9.5.23..
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var transactionVM: TransactionViewModel
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [.purple, .indigo]), startPoint: .trailing, endPoint: .leading)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                            .padding(.top, -30)
                        
                        BalanceSummaryView()
                            .padding(.top, 30)
                            .padding(.bottom, 80)
                    }
                    .ignoresSafeArea()
                    
                    RecentTransactionsView()
                        .padding(.top, -140)
                        .onAppear {
                            transactionVM.fetchTransactionData()
                        }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
