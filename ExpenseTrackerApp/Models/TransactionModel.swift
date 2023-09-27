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
    
    
//    static var sampleTransaction = TransactionModel(id: UUID(), title: "Title", category: CategoryModel.getFromDefault(name: Categories.bills)!, type: TransactionType.income, amount: 0.0, date: Date.now)
//    
//    static var sampleTransactions = [
//        TransactionModel(title: "Salary", category: CategoryModel.getFromDefault(name: Categories.salary)!, type: .income, amount: 2500, date: Date.now),
//        TransactionModel(title: "Bonus", category: CategoryModel.getFromDefault(name: Categories.salary)!, type: .income, amount: 300, date: Date.now),
//        TransactionModel(title: "Food", category: CategoryModel.getFromDefault(name: Categories.food)!, type: .expense, amount: 200, date: Date.now),
//        TransactionModel(title: "Holiday", category: CategoryModel.getFromDefault(name: Categories.vacation)!, type: .expense, amount: 3200, date: Date.now),
//        TransactionModel(title: "Salary", category: CategoryModel.getFromDefault(name: Categories.salary)!, type: .income, amount: 2500, date: Date.now),
//        TransactionModel(title: "Clothing", category: CategoryModel.getFromDefault(name: Categories.shopping)!, type: .expense, amount: 350, date: Date.now),
//        TransactionModel(title: "Bonus", category: CategoryModel.getFromDefault(name: Categories.salary)!, type: .income, amount: 300, date: Date.now)
//    ]
}
