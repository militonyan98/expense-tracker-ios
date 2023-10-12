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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
