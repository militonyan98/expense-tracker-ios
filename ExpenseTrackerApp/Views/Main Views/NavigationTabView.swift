//
//  NavigationTabView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 9.5.23..
//

import SwiftUI

struct NavigationTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .edgesIgnoringSafeArea(.top)
            
            TransactionsView()
                .tabItem {
                    Label("Transactions", systemImage: "list.clipboard.fill")
                }
            
            AddView()
                .tabItem {
                    Image(systemName: "plus")
                }
            
            CategoryView()
                .tabItem {
                    Label("Categories", systemImage: "square.split.2x2.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
        .accentColor(.cyan)    }
}

struct NavigationTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTabView()
    }
}
