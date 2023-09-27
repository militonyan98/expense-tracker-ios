//
//  CategoryViewModel.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 2.6.23..
//

import Foundation
import CoreData

class CategoryViewModel: ObservableObject {
    var categoriesDB: [Category] = []
    var dataController: DataController? = nil
    var categoryDataController : CategoryDataController? = nil
    @Published private var categories: [CategoryModel] = []
    @Published var searchText = ""
    
    init() {
        self.dataController = DataController()
        setDataController(data: self.dataController!)
    }
    
    var filteredCategories: [CategoryModel] {
        if searchText.isEmpty {
            return categories
        } else {
            return categories.filter {
                $0.name.rawValue.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func fetchCategoryData() {
        categories = categoryDataController!.fetchCategoryModels()
    }
    
    func setDataController(data: DataController) {
        self.dataController = data
        self.categoryDataController = CategoryDataController(dataController: data)
        fetchCategoryData()
    }
}
