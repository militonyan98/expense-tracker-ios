//
//  CategoryModel.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 30.5.23..
//

import SwiftUI

struct CategoryModel {
    var name: Categories
    var icon: CategoryIcon?
    
    struct CategoryIcon {
        var image: String
        var color: UIColor
    }
    
    static var categories = [
        CategoryModel(name: ExpenseTrackerApp.Categories.bills, icon: CategoryIcon(image: "dollarsign", color: UIColor.systemMint)),
        CategoryModel(name: ExpenseTrackerApp.Categories.salary, icon: CategoryIcon(image: "arrow.down", color: UIColor.systemGreen)),
        CategoryModel(name: ExpenseTrackerApp.Categories.food, icon: CategoryIcon(image: "takeoutbag.and.cup.and.straw", color: UIColor.systemRed)),
        CategoryModel(name: ExpenseTrackerApp.Categories.shopping, icon: CategoryIcon(image: "bag", color: UIColor.systemPurple)),
        CategoryModel(name: ExpenseTrackerApp.Categories.entertainment, icon: CategoryIcon(image: "popcorn", color: UIColor.systemOrange)),
        CategoryModel(name: ExpenseTrackerApp.Categories.cafes, icon: CategoryIcon(image: "fork.knife", color: UIColor.systemPink)),
        CategoryModel(name: ExpenseTrackerApp.Categories.car, icon: CategoryIcon(image: "car", color: UIColor.systemIndigo)),
        CategoryModel(name: ExpenseTrackerApp.Categories.hygiene, icon: CategoryIcon(image: "shower", color: UIColor.systemBlue)),
        CategoryModel(name: ExpenseTrackerApp.Categories.health, icon: CategoryIcon(image: "cross.case", color: UIColor.systemTeal)),
        CategoryModel(name: ExpenseTrackerApp.Categories.pets, icon: CategoryIcon(image: "pawprint", color: UIColor.brown)),
        CategoryModel(name: ExpenseTrackerApp.Categories.vacation, icon: CategoryIcon(image: "beach.umbrella", color: UIColor.systemYellow)),
        CategoryModel(name: ExpenseTrackerApp.Categories.other, icon: CategoryIcon(image: "ellipsis", color: UIColor.systemGray))
    ]
//    
//    static func getFromDefault(name : ExpenseTrackerApp.Categories) -> CategoryModel? {
//        for category in categories {
//            if category.name == name {
//                return category
//            }
//        }
//        
//        return nil
//    }
}
