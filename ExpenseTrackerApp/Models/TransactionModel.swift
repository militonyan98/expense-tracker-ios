//
//  TransactionModel.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 30.5.23..
//

import SwiftUI

struct TransactionModel: Identifiable {
    var id: UUID
    var title: String
    var category: CategoryModel
    var type: TransactionType
    var amount: Float
    var date: Date
    
    init(id: UUID, title: String, category: CategoryModel, type: TransactionType, amount: Float, date: Date) {
        self.id = id
        self.title = title
        self.category = category
        self.type = type
        self.amount = amount
        self.date = date
    }
}
