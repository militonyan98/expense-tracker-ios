//
//  UploadProfileImageView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct UploadProfileImageView: View {
//    @Binding var showingImagePicker: Bool
    
    //onClick event
    var onClick: (() -> Void)?
    
    var body: some View {
        Button {
            // call onclick
            onClick?()
//            showingImagePicker = true
        } label: {
            HStack {
                Text("Upload a photo")
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

extension UploadProfileImageView {
    func onClick(_ handler: @escaping () -> Void) -> UploadProfileImageView {
        var new = self
        new.onClick = handler
        return new
    }
}

//struct UploadProfileImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadProfileImageView()
//    }
//}
