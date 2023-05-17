//
//  HomeView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 9.5.23..
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.purple, .indigo]), startPoint: .trailing, endPoint: .leading)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
                    
                    BalanceSummaryView()
                        .padding(.top, 25)
                        .padding(.bottom, 110)
                }
                .ignoresSafeArea()
                
                TransactionsListView()
                    .padding(.top, -110)
                
            }
        }
    }
}

struct TransactionView: View, Identifiable {
    var id = UUID()
    
    @State var title: String
    @State var amount: Double
    @State var date: Date
    @State var transactionType: TransactionType
    
    var amountString: String {
        let initial = transactionType == .income ? "+ $" : "- $"
        let formatedAmount = String(format: "\(initial)%.2f", amount)
        
        return formatedAmount
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Spacer()
            
            ZStack {
                Circle()
                    .frame(width: 45, height: 45)
                    .foregroundColor(.indigo.opacity(0.6))
                
                Image(systemName: "signature")
                    .foregroundColor(.indigo)
            }
            .padding(.trailing)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .fontWeight(.medium)
                    //.padding(.bottom, 3)
                Text(Date.now, format: .dateTime.hour().minute().day().month())
                    .font(.caption)
            }
            
            Spacer()
            Spacer()
            //Divider()
            
            Text(amountString)
                .fontWeight(.semibold)
                .foregroundColor(transactionType == .income ? .green : .red)
            
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
    var transactions = [TransactionView(title: "Salary", amount: 2500, date: Date.now, transactionType: .income), TransactionView(title: "Bonus", amount: 300, date: Date.now, transactionType: .income), TransactionView(title: "Food", amount: 200, date: Date.now, transactionType: .expense), TransactionView(title: "Holiday", amount: 3200, date: Date.now, transactionType: .expense), TransactionView(title: "Salary", amount: 2500, date: Date.now, transactionType: .income), TransactionView(title: "Clothing", amount: 350, date: Date.now, transactionType: .expense), TransactionView(title: "Bonus", amount: 300, date: Date.now, transactionType: .income)]
    
    var body: some View {
        List {
            ForEach(transactions) { transaction in
                transaction
            }
            .listRowSeparator(.hidden)
            
        }
        .scrollContentBackground(.hidden)
    }
}

struct BalanceSummaryView: View {
    var body: some View {
        VStack(spacing: 10) {
            CurrentBalanceView()
            
            HStack {
                Spacer()
                VStack {
                    TransactionDetailsView(transactionType: .income, amount: "$40,000")
                }
                Spacer()
                Spacer()
                VStack {
                    TransactionDetailsView(transactionType: .expense, amount: "$10,000")
                }
                Spacer()
            }
        }
        .foregroundColor(.white)
        
    }
}

struct CurrentBalanceView: View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Current Balance:".uppercased())
                .font(.system(size: 10, design: .monospaced))
                .fontWeight(.bold)
                .tracking(2)
                .foregroundColor(.white.opacity(0.5))
            
            Text("$30,000")
                .font(.system(size: 40))
                .bold()
            
            Text("September 2023")
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
            Image(systemName: transactionType == . income ? "arrow.down.backward" : "arrow.up.right")
                .frame(width: 1, height: 1)
                .foregroundColor(transactionType == . income ? .green : .red)
                .padding()
                .background(.white)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 5) {
                Text(transactionType == . income ? "Income".uppercased() : "Expense".uppercased())
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
