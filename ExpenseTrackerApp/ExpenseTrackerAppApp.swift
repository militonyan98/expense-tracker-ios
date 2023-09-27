//
//  ExpenseTrackerAppApp.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 9.5.23..
//

import SwiftUI

@main
struct ExpenseTrackerAppApp: App {
    @StateObject private var dataController = DataController()
    @StateObject private var transactionViewModel = TransactionViewModel()
    @StateObject private var categoryViewModel = CategoryViewModel()
    @StateObject private var userVM = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataController)
                .environmentObject(transactionViewModel)
                .environmentObject(categoryViewModel)
                .environmentObject(userVM)
                //.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
