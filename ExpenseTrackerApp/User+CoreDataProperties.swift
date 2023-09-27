//
//  User+CoreDataProperties.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 29.5.23..
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var id: UUID?
    @NSManaged public var transaction: NSSet?
    
    public var unwrappedName: String {
        name ?? "Unknown Name"
    }
    
    public var unwrappedImage: String {
        image ?? "Unknown Image"
    }
    
    public var transactionArray: [Transaction] {
        let set = transaction as? Set<Transaction> ?? []
        
        return set.sorted {
            $0.unwrappedDate > $1.unwrappedDate
        }
    }
    
}

// MARK: Generated accessors for transaction
extension User {

    @objc(addTransactionObject:)
    @NSManaged public func addToTransaction(_ value: Transaction)

    @objc(removeTransactionObject:)
    @NSManaged public func removeFromTransaction(_ value: Transaction)

    @objc(addTransaction:)
    @NSManaged public func addToTransaction(_ values: NSSet)

    @objc(removeTransaction:)
    @NSManaged public func removeFromTransaction(_ values: NSSet)

}

extension User : Identifiable {

}
