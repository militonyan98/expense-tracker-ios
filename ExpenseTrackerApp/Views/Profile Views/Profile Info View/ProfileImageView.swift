//
//  ProfileImageView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct ProfileImageView: View {
    @Binding var image: Image?
    @Binding var showingImagePicker: Bool
    @Binding var inputImage: UIImage?
    
    var imageToDisplay: Image {
        return image != nil ? image! : Image(systemName: "person")
    }
    
    var body: some View {
        imageToDisplay
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .frame(width: 100, height: 100)
            .onTapGesture {
                showingImagePicker = true
            }
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

//struct ProfileImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileImageView()
//    }
//}
