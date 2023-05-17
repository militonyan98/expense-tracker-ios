//
//  ProfileInfoView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct ProfileInfoView: View {
    @Binding var image: Image?
    @Binding var showingImagePicker: Bool
    @Binding var inputImage: UIImage?
    @Binding var name: String
    @Binding var showingTextfield: Bool
    
    var body: some View {
        VStack {
            ProfileImageView(image: $image, showingImagePicker: $showingImagePicker, inputImage: $inputImage)
            
            ProfileNameView(name: $name, showingTextfield: $showingTextfield)
            .padding(10)
            
            Spacer()
        }
        .foregroundColor(.white)
    }
}

//struct ProfileInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileInfoView()
//    }
//}
