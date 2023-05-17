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
            
            CategoryView()
                .tabItem {
                    Label("Category", systemImage: "square.split.2x2.fill")
                }
            
            AddView()
                .tabItem {
                    Image(systemName: "plus")
                }
            
            ChartView()
                .tabItem {
                    Label("Chart", systemImage: "chart.pie.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
        //.accentColor(.indigo)
        //.padding(.bottom)
    }
}

struct NavigationTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTabView()
    }
}
