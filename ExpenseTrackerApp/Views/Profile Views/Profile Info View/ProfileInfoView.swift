//
//  ProfileInfoView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct ProfileInfoView: View {
//    @EnvironmentObject var userVM: UserViewModel
    @Binding var image: Image?
    @Binding var showingImagePicker: Bool
    @Binding var inputImage: UIImage?
    let name: String
    @Binding var showingTextfield: Bool
    
    var body: some View {
        VStack {
            ProfileImageView(image: $image, showingImagePicker: $showingImagePicker, inputImage: $inputImage)
//            ProfileImageView()
            
            ProfileNameView(name: name, showingTextfield: $showingTextfield)
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
