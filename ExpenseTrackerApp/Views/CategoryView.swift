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
                            .font(.title)
                            .fontWeight(.medium)
                            .tracking(5)
                            .foregroundColor(.indigo.opacity(0.85))
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AddView()) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.cyan)
                        }
                    }
                }
        }
        .searchable(text: $searchText)
    }
}

struct CategoryIconView: View {
    var imageName: String
    var color: Color
    
    var body: some View {
        ZStack {
            Circle().fill(color.opacity(0.2))
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(color)
        }
        .frame(width: 40, height: 40)
    }
}

struct CategoriesList: View {
    @Binding var searchText: String
    var categories = Category.allCases
    var icons: [Category:CategoryIconView] = [
        Category.bills : CategoryIconView(imageName: "dollarsign", color: .mint),
        Category.salary : CategoryIconView(imageName: "arrow.down", color: .green),
        Category.food : CategoryIconView(imageName: "takeoutbag.and.cup.and.straw", color: .red),
        Category.shopping : CategoryIconView(imageName: "bag", color: .purple),
        Category.entertainment : CategoryIconView(imageName: "popcorn", color: .orange),
        Category.cafes : CategoryIconView(imageName: "fork.knife", color: .pink),
        Category.car : CategoryIconView(imageName: "car", color: .indigo),
        Category.hygiene : CategoryIconView(imageName: "shower", color: .blue),
        Category.health: CategoryIconView(imageName: "cross.case", color: .teal),
        Category.vacation : CategoryIconView(imageName: "beach.umbrella", color: .yellow),
        Category.other : CategoryIconView(imageName: "ellipsis", color: .gray)
    ]
    
    var filteredCategories: [Category] {
           if searchText.isEmpty {
               return categories
           } else {
               return categories.filter { $0.rawValue.lowercased().contains(searchText.lowercased()) }
           }
       }
    
    var body: some View {
        List {
            ForEach(0..<filteredCategories.count, id: \.self) { index in
                HStack(spacing: 20) {
                    icons[filteredCategories[index]]
                    Text(filteredCategories[index].rawValue.uppercased())
                        .fontWeight(.medium)
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        //.scrollContentBackground(.hidden)
    }
}

enum Category: String, CaseIterable, Identifiable {
    case bills, salary, food, shopping, entertainment, cafes, car, hygiene, health, vacation, other
    
    var id: Category { self }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
