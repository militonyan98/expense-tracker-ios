//
//  User+CoreDataProperties.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 3.10.23..
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var transaction: NSSet?
    
    public var unwrappedName: String {
        return name ?? ""
    }
    
    public var unwrappedImage: Data {
        return image ?? Data()
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
