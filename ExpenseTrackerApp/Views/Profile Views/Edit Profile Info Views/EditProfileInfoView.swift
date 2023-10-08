//
//  EditProfileInfoView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct EditProfileInfoView: View {
    let userID: UUID
    @Binding var name: String
    @Binding var showingImagePicker: Bool
    @Binding var image: Image?
    @Binding var inputImage: UIImage?
    
    var body: some View {
        VStack(alignment: .leading) {
            EditProfileNameView(userID: userID, name: $name)
            .padding(.bottom, 5)
            
            UploadProfileImageView(showingImagePicker: $showingImagePicker)
        }
        .onChange(of: inputImage) { _ in loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        
        Spacer()
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

//struct EditProfileInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileInfoView()
//    }
//}
