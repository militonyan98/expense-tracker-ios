//
//  NewCustomer+CoreDataProperties.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 10.9.23..
//
//

import Foundation
import CoreData


extension NewCustomer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewCustomer> {
        return NSFetchRequest<NewCustomer>(entityName: "NewCustomer")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var image: String?
    
    public var unwrappedID: UUID {
        id ?? UUID()
    }
    
    public var unwrappedName: String {
        name ?? "Unknown Name"
    }
    
    public var unwrappedImage: String {
        image ?? "Unknown Image"
    }

}

extension NewCustomer : Identifiable {

}
