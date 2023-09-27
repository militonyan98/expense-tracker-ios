//
//  CategoryController.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 6.6.23..
//

import SwiftUI
import CoreData

class CategoryDataController {
    var dataController: DataController
    
    var moc : NSManagedObjectContext {
        return dataController.moc
    }
    
    init(dataController: DataController) {
        self.dataController = dataController
        addCategoriesToDbIfTheyDontExist()
    }
    
    func fetchCategories() -> [Category] {
        do {
            let categories = try moc.fetch(Category.fetchRequest())
            
//            for defaultCategory in CategoryModel.categories {
//                for category in categories {
//                    if category.name == defaultCategory.name.rawValue {
//                        category.color = defaultCategory.icon?.color
//                    }
//                }
//            }
//            
//            save()
            
            return categories
        } catch {
            return []
        }
    }
    
    func fetchCategoryModels() -> [CategoryModel] {
        let categories = fetchCategories()
        var categoryModels = [CategoryModel]()
        
        for category in categories {
            categoryModels.append(CategoryModel(name: Categories(rawValue: category.unwrappedName)!, icon: CategoryModel.CategoryIcon(image: category.unwrappedIcon, color: category.unwrappedColor)))
        }
        
        return categoryModels
    }
    
    func addCategoriesToDbIfTheyDontExist(){
        let categories = self.fetchCategories()
        
        if !categories.isEmpty {
            return
        }
        
        for category in CategoryModel.categories {
           add(category: category)
        }
    }
    
    func add(category : CategoryModel) {
        let newCategory = Category(context: moc)
        newCategory.name = category.name.rawValue
        newCategory.icon = category.icon?.image
        
        let color = category.icon?.color ?? UIColor.black
        
        _ = try? NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
       
        newCategory.color = color
        
        save()
    }
    
    func save() {
        try? moc.save()
    }
    
    func getCategoryByName(categoryName: String) -> Category? {
        let categories = self.fetchCategories()
        for category in categories {
            if category.name == categoryName {
                return category
            }
        }
        
        return nil
    }
}
