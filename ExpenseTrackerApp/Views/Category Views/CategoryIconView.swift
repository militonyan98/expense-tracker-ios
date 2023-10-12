//
//  CategoryIconView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.10.23..
//

import SwiftUI

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

//#Preview {
//    CategoryIconView()
//}
