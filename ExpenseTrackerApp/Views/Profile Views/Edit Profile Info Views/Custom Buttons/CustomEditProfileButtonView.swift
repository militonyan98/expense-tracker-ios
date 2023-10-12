//
//  CustomEditProfileButtonView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.10.23..
//

import SwiftUI

struct CustomEditProfileButtonView: View {
    var onClick: (() -> Void)?
    var label: String
    var icon: String
    var color: Color?
    
    var body: some View {
        Button {
            onClick?()
        } label: {
            HStack {
                Text(label)
                Image(systemName: icon)
            }
            .padding(10)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [.indigo, .gray]), startPoint: .leading, endPoint: .trailing).opacity(0.2))
                .allowsHitTesting(false)
        }
        .foregroundColor(color)
        .shadow(color: .gray, radius: 10)
    }
}

//#Preview {
//    CustomEditProfileButtonView()
//}
