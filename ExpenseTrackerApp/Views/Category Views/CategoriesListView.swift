//
//  CategoriesListView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.10.23..
//

import SwiftUI

struct CategoriesListView: View {
    @EnvironmentObject var categoryVM: CategoryViewModel
    @Binding var searchText: String
    var categories = Categories.allCases
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<categoryVM.filteredCategories.count, id: \.self) { index in
                    NavigationLink(destination: TransactionsListView(givenCategory: categoryVM.filteredCategories[index])) {
                        HStack(spacing: 20) {
                            CategoryIconView(imageName: categoryVM.filteredCategories[index].icon?.image ?? "", color: categoryVM.filteredCategories[index].icon?.color ?? UIColor.black)
                            Text(categoryVM.filteredCategories[index].name.rawValue.uppercased())
                                .fontWeight(.medium)
                        }
                        .listRowSeparator(.hidden)
                        
                    }
                }
            }
            .listStyle(.plain)
            .searchable(text: $categoryVM.searchText, placement: .navigationBarDrawer(displayMode: .always))
            //.scrollContentBackground(.hidden)
        }
    }
}

//#Preview {
//    CategoriesListView()
//}
