//
//  Category+CoreDataProperties.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 29.5.23..
//
//

import SwiftUI
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var icon: String?
    @NSManaged public var transaction: NSSet?
    @NSManaged public var color: UIColor?
    
    public var unwrappedName: String {
        name ?? "Unknown Name"
    }
    
    public var unwrappedIcon: String {
        icon ?? "Unknown Icon"
    }
    
    public var transactionArray: [Transaction] {
        let set = transaction as? Set<Transaction> ?? []
        
        return set.sorted {
            $0.unwrappedDate > $1.unwrappedDate
        }
    }
    
    public var unwrappedColor: UIColor {
       if color == nil {
           return UIColor.clear
       }
        
        return color!
    }

}

// MARK: Generated accessors for transaction
extension Category {

    @objc(addTransactionObject:)
    @NSManaged public func addToTransaction(_ value: Transaction)

    @objc(removeTransactionObject:)
    @NSManaged public func removeFromTransaction(_ value: Transaction)

    @objc(addTransaction:)
    @NSManaged public func addToTransaction(_ values: NSSet)

    @objc(removeTransaction:)
    @NSManaged public func removeFromTransaction(_ values: NSSet)

}

extension Category : Identifiable {

}
