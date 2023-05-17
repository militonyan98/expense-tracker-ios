//
//  CustomTextFieldStyle.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [.indigo, .gray]), startPoint: .leading, endPoint: .trailing).opacity(0.2)))
            .shadow(color: .gray, radius: 10)
            .foregroundColor(.indigo)
            .font(.headline)
    }
}
