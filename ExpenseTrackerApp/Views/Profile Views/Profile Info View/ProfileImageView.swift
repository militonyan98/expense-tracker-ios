//
//  ProfileImageView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI
import PhotosUI

struct ProfileImageView: View {
//    @State private var avatarItem: PhotosPickerItem?
//    @State private var avatarImage: Image?
//
//    var body: some View {
//        VStack {
//            PhotosPicker("Select avatar", selection: $avatarItem, matching: .images)
//
//            if let avatarImage {
//                avatarImage
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 300, height: 300)
//
//            }
//        }
//        .onChange(of: avatarItem) { _ in
//            Task {
//                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
//                    if let uiImage = UIImage(data: data) {
//                        avatarImage = Image(uiImage: uiImage)
//                        return
//                    }
//                }
//
//                print("Failed")
//            }
//        }
//    }
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
