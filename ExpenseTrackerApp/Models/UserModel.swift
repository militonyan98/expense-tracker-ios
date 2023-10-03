//
//  UserModel.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 30.5.23..
//

import SwiftUI

struct UserModel: Identifiable {
    var id = UUID()
    var name: String
    var image: UIImage
    var transactions: [Transaction]
    
    static var sampleUser = UserModel(id: UUID(uuidString: "0000-0000-0000-0001") ?? UUID(), name: "User", image: UIImage(), transactions: [])
}
