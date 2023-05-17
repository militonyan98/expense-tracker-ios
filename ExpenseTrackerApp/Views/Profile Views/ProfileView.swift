//
//  ProfileView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 9.5.23..
//

import SwiftUI

struct ProfileView: View {
    @State private var name: String = ""
    @State private var showingTextfield = false
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ZStack {
                    Ellipse()
                        .fill(LinearGradient(gradient: Gradient(colors: [.purple, .indigo]), startPoint: .trailing, endPoint: .leading))
                        .frame(width: geometry.size.width * 2.5, height: geometry.size.height * 0.4)
                        .position(x: geometry.size.width / 4, y: geometry.size.height * 0.08)
                        .shadow(radius: 3)
                    
                    ProfileInfoView(image: $image, showingImagePicker: $showingImagePicker, inputImage: $inputImage, name: $name, showingTextfield: $showingTextfield)
                    .padding(.top, 25)
                }
                .ignoresSafeArea()
                
                if showingTextfield {
                    EditProfileInfoView(name: $name, showingImagePicker: $showingImagePicker)
                    .padding()
//                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.2)
                }
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
