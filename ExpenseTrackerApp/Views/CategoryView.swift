//
//  CategoryView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 9.5.23..
//

import SwiftUI

struct CategoryView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            CategoriesList(searchText: $searchText)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Categories".uppercased())
                            .font(.title2)
                            .fontWeight(.medium)
                            .tracking(5)
                            .foregroundColor(.indigo.opacity(0.85))
                    }
                    
//                    ToolbarItem(placement: .navigationBarTrailing) {
////                        NavigationLink(destination: AddView()) {
//                            Image(systemName: "plus")
//                                .resizable()
//                                .frame(width: 25, height: 25)
//                                .foregroundColor(.cyan)
////                        }
//                    }
                }
        }
    }
}

struct CategoryIconView: View {
    var imageName: String
    var color: UIColor
    
    var body: some View {
        ZStack {
            Circle().fill(Color(color).opacity(0.2))
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(Color(color))
        }
        .frame(width: 40, height: 40)
    }
}

struct CategoriesList: View {
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

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
