//
//  UserController.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 9.6.23..
//

import Foundation
import CoreData
import UIKit

class UserController {
    var dataController: DataController
    
    init(dataController: DataController) {
        self.dataController = dataController
        
    }
    
    var moc: NSManagedObjectContext {
        return dataController.moc
    }
    
    func fetchUser() -> User? {
        var user: User?
        do {
            let users = try moc.fetch(User.fetchRequest())
            
//            for i in 0..<users.count {
//                moc.delete(users[i])
//            }
//
//            try moc.save()
            
            if users.count >= 1 {
                user = users[0]
            }
            
            return user
        } catch {
            return nil
        }
    }
    
    func fetchUserModel() -> UserModel? {
        let fetchedUser = fetchUser()
        var userModel: UserModel? = nil
        
        if fetchedUser != nil {
            userModel = UserModel(name: "", image: UIImage(), transactions: [])
            userModel?.name = fetchedUser?.unwrappedName ?? ""
            userModel?.id = fetchedUser?.id ?? UUID()
            if fetchedUser?.image != nil {
                userModel?.image = UIImage(data: fetchedUser!.image!)!
            }
            
            
            //userModel?.image = fetchedUser?.image!
//            userModel?.image = fetchedUser?.unwrappedImage ?? ""
            //userModel.transactions = fetchedUser?.transactionArray ?? []
            
        }
        
        
       
        return userModel
    }
    
    func save() {
        try? moc.save()
//        do {
//            if moc.hasChanges {
//                try moc.save()
//            }
//        } catch {
//            // handle the Core Data error
//        }
    }
    
    // usermodel
    func add(user: UserModel) {
        let newUser = User(context: moc)
//        newUser.id = UUID()
        newUser.name = user.name
        newUser.image = user.image.pngData()
        
        save()
    }
    
    // usermodel
    func update(user: UserModel)  {
        let fetchedUser = fetchUser()
        
//        if fetchedUser != nil {
            fetchedUser!.name = user.name
        let data = user.image.pngData()
        
        fetchedUser!.image = data
//        }
        
        save()
    }
}
