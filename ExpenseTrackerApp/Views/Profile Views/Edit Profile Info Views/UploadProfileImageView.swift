//
//  UploadProfileImageView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct UploadProfileImageView: View {
    @Binding var showingImagePicker: Bool
    
    var body: some View {
        Button {
            showingImagePicker = true
        } label: {
            HStack {
                Text("Upload image")
                Image(systemName: "photo.on.rectangle")
            }
            .padding(10)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [.indigo, .gray]), startPoint: .leading, endPoint: .trailing).opacity(0.2))
                .allowsHitTesting(false)
        }
        .shadow(color: .gray, radius: 10)
    }
}

//struct UploadProfileImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadProfileImageView()
//    }
//}
