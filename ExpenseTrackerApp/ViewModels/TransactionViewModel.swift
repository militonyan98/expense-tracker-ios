//
//  TransactionViewModel.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 1.6.23..
//

import Foundation
import CoreData

class TransactionViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var sortType: SortType = .date
    @Published var transactions: [TransactionModel] = []
    private var dataController: DataController? = nil
    private var categoryDataController: CategoryDataController? = nil
    private var transactionsController: TransactionController? = nil
    
    init(){
        self.dataController = DataController()
        setDataController(data: self.dataController!)
    }
    
    var filteredTransactions: [TransactionModel] {
        if searchText.isEmpty {
            return transactions.sorted{ $0.date > $1.date }
        } else {
            return transactions.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var sortedTransactions: [TransactionModel] {
        if sortType == .date {
            return filteredTransactions.sorted { $0.date > $1.date }
        }
        
        if sortType == .alphabetical {
            return filteredTransactions.sorted { $0.title.lowercased() < $1.title.lowercased() }
        }
        
        if sortType == .type {
            return filteredTransactions.sorted { $0.type.rawValue < $1.type.rawValue }
        }
        
        if sortType == .amountAscending {
            return filteredTransactions.sorted { getValue(transaction: $0) < getValue(transaction: $1) }
        }
        
        if sortType == .amountDescending {
            return filteredTransactions.sorted { getValue(transaction: $0) > getValue(transaction: $1) }
        }
        
        return filteredTransactions
    }
    
    func getValue(transaction: TransactionModel) -> Float {
        return transaction.amount * Float(transaction.type == .expense ? -1 : 1)
    }
    
    func fetchTransactionData() {
        transactions = transactionsController?.fetchTransactionModels() ?? []
        
    }
    
    func setDataController(data: DataController) {
        self.dataController = data
        self.categoryDataController = CategoryDataController(dataController : data)
        self.transactionsController = TransactionController(dataController: data)
        
        fetchTransactionData()
    }
    
    func add(transaction: TransactionModel) {
        transactionsController?.add(transaction: transaction)
        
        fetchTransactionData()
    }
    
    func convertToDbCategory(_ categoryModel: CategoryModel?) -> Category? {
        if categoryModel == nil {
            return nil
        }
            
        return self.categoryDataController?.getCategoryByName(categoryName: categoryModel!.name.rawValue)
    }
        
    func find(transaction id: UUID) -> TransactionModel? {
        for transaction in transactions {
            if transaction.id == id {
                return transaction
            }
        }
        
        return nil
    }
    
    func update(transaction: TransactionModel) {
        objectWillChange.send()
        transactionsController?.update(transaction: transaction)
        
        for currentTransactionIndex in 0..<transactions.count {
            var currentTransaction = transactions[currentTransactionIndex]
            if transaction.id == currentTransaction.id {
                currentTransaction.amount = transaction.amount
                currentTransaction.category = transaction.category
                currentTransaction.date = transaction.date
                currentTransaction.title = transaction.title
                currentTransaction.type = transaction.type
                transactions[currentTransactionIndex] = currentTransaction
            }
        }
        fetchTransactionData()
    }
    
    // remove
    func remove(at offsets: IndexSet) {
        for offset in offsets {
            let transactionToBeDeleted = sortedTransactions[offset]
            transactionsController?.remove(transaction: transactionToBeDeleted.id)
        }
        
        fetchTransactionData()
    }
    
    func removeBy(id: UUID) {
        transactionsController?.remove(transaction: id)
        fetchTransactionData()
    }
}
