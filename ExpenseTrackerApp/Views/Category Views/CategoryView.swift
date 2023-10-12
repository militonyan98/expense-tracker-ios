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
            CategoriesListView(searchText: $searchText)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Categories".uppercased())
                            .font(.title2)
                            .fontWeight(.medium)
                            .tracking(5)
                            .foregroundColor(.indigo.opacity(0.85))
                    }
                }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
