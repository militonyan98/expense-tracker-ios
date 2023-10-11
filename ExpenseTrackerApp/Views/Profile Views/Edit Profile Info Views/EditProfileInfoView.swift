//
//  EditProfileInfoView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct DeleteProfileImageView: View {
    var onClick: (() -> Void)?
    
    var body: some View {
        Button {
            onClick?()
        } label: {
            HStack {
                Text("Delete the photo")
                Image(systemName: "trash.fill")
            }
            .padding(10)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: [.indigo, .gray]), startPoint: .leading, endPoint: .trailing).opacity(0.2))
                .allowsHitTesting(false)
        }
        .foregroundColor(.red)
        .shadow(color: .gray, radius: 10)
    }
}

extension DeleteProfileImageView {
    func onClick(_ handler: @escaping () -> Void) -> DeleteProfileImageView {
        var new = self
        new.onClick = handler
        return new
    }
}

struct EditProfileInfoView: View {
    @Binding var name: String
    @State var showingImagePicker: Bool = false
    @State var inputImage: UIImage?
    
    var onDeleteClick: (() -> Void)?
    var onImageChange: ((_ img : UIImage) -> Void)?
    
    var body: some View {
        VStack(alignment: .leading) {
            EditProfileNameView(name: $name)
            .padding(.bottom, 5)
            
            HStack {
                UploadProfileImageView() // no more argument required
                    .onClick { showingImagePicker = true }
                
                DeleteProfileImageView()
                    .onClick { onDeleteClick?() }
            }
        }
        .onChange(of: inputImage) { _ in loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        
        Spacer()
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        onImageChange?(inputImage)
    }
}

extension EditProfileInfoView {
    func onDeleteClick(_ handler: @escaping () -> Void) -> EditProfileInfoView {
        var new = self
        new.onDeleteClick = handler
        return new
    }
    
    func onImageChange(_ handler: @escaping (_ img: UIImage) -> Void) -> EditProfileInfoView {
        var new = self
        new.onImageChange = handler
        return new
    }
}

//struct EditProfileInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileInfoView()
//    }
//}
