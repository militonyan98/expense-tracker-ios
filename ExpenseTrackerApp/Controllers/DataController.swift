//
//  DataController.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 17.5.23..
//

import SwiftUI
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "DataModel")
    
    var moc : NSManagedObjectContext {
        return container.viewContext
    }
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
        }
    }
}
