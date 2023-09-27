//
//  Transaction+CoreDataProperties.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 29.5.23..
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var title: String?
    @NSManaged public var amount: Float
    @NSManaged public var id: UUID
    @NSManaged public var date: Date?
    @NSManaged public var type: String?
    @NSManaged public var category: Category?
    @NSManaged public var user: User?

    public var unwrappedTitle: String {
        title ?? "Unknown Title"
    }
    
    public var unwrappedDate: Date {
        date ?? Date.now
    }
    
    public var unwrappedType: String {
        type ?? TransactionType.expense.rawValue
    }
}

extension Transaction : Identifiable {

}
