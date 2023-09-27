//
//  TransactionController.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 6.6.23..
//

import SwiftUI
import CoreData

class TransactionController {
    var dataController: DataController
    var categoryDataController: CategoryDataController
   // var userController: UserController
    
    var moc: NSManagedObjectContext {
        return dataController.moc
    }
    
    init(dataController: DataController) {
        self.dataController = dataController
        self.categoryDataController = CategoryDataController(dataController: dataController)
       // self.userController = UserController(dataController: dataController)
    }
    
    func fetchTransactions() -> [Transaction] {
        do {
            return try moc.fetch(Transaction.fetchRequest())
        } catch {
            return []
        }
    }
    
    func fetchTransactionModels() -> [TransactionModel] {
        let fetchedTransactions = fetchTransactions()
        var transactions: [TransactionModel] = []
        
        for transaction in fetchedTransactions {
            transactions.append(TransactionModel(id: transaction.id,title: transaction.unwrappedTitle, category: CategoryModel(name: Categories(rawValue: transaction.category!.unwrappedName)!, icon: CategoryModel.CategoryIcon(image: transaction.category!.unwrappedIcon, color: transaction.category!.unwrappedColor)), type: TransactionType(rawValue: transaction.unwrappedType)!, amount: transaction.amount, date: transaction.unwrappedDate))
        }
        
        return transactions
    }
    
    func add(transaction: TransactionModel) {
        let newTransaction = Transaction(context: moc)
        newTransaction.id = UUID()
        newTransaction.title = transaction.title
        newTransaction.category = categoryDataController.getCategoryByName(categoryName: transaction.category.name.rawValue)
        newTransaction.type = transaction.type.rawValue
        newTransaction.amount = transaction.amount
        newTransaction.date = transaction.date
       // newTransaction.user = userController.fetchUser()
        
        save()
    }
    
    func save() {
        try? moc.save()
    }
    
    func update(transaction: TransactionModel) {
        let transactions = fetchTransactions()
        for index in 0..<transactions.count {
            if transaction.id == transactions[index].id {
                transactions[index].title = transaction.title
                transactions[index].category = categoryDataController.getCategoryByName(categoryName: transaction.category.name.rawValue)
                transactions[index].type = transaction.type.rawValue
                transactions[index].amount = transaction.amount
                transactions[index].date = transaction.date
                break
            }
        }
        
        save()
    }
    
    func remove(transaction id: UUID) {
        let transactions = fetchTransactions()
        
        for index in 0..<transactions.count {
            if id == transactions[index].id {
                moc.delete(transactions[index])
                break
            }
        }
        
        save()
    }
}
