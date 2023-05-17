//
//  BalanceType.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import Foundation

enum TransactionType: String, CaseIterable, Identifiable {
    case income, expense
    
    var id: TransactionType { self }
}
