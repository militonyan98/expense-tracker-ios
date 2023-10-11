//
//  UserViewModel.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 13.8.23..
//

import Foundation
import CoreData

class UserViewModel: ObservableObject {
    @Published var user: UserModel = UserModel.sampleUser
    private var dataController: DataController? = nil
    private var userController: UserController? = nil
    
    init() {
        self.dataController = DataController()
        setDataController(data: self.dataController!)
    }
    
    func setDataController(data: DataController) {
        self.dataController = data
        self.userController = UserController(dataController : data)
        
        fetchUserData()
    }
    
    func fetchUserData() {
        user = userController?.fetchUserModel() ?? UserModel.sampleUser
        
    }
    
    func createorUpdateUser(user: UserModel) {
        var alreadyUser = userController?.fetchUserModel()
        
        if alreadyUser != nil {
            alreadyUser?.name = user.name
            alreadyUser?.image = user.image
            alreadyUser?.id = user.id
            
            update(user: alreadyUser!)
            
            return
        }
        
        add(user: user)
    }
    
    func add(user: UserModel) {
        userController?.add(user: user)
        
        fetchUserData()
    }
    
    func update(user: UserModel) {
        userController?.update(user: user)
        
        // fetch
        fetchUserData()
    }
}
