//
//  ProfileImageView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI
import PhotosUI

struct ProfileImageView: View {
    @Binding var image: Image?
    
    var imageToDisplay: Image {
        if image != nil {
            return image!
        }
        return Image(systemName: "person.crop.circle.fill")
    }
    
    var body: some View {
        imageToDisplay
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .frame(width: 100, height: 100)
        }
}

//struct ProfileImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileImageView()
//    }
//}
