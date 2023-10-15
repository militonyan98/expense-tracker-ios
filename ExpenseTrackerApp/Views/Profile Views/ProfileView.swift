//
//  ProfileView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 9.5.23..
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    @State private var userID: UUID?
    
    @State private var name: String = ""
    @State private var showingTextfield = false
    
    @State private var image: Image?
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
                    
                    ProfileInfoView(image: $image, name: userVM.user.name)
                        .onEditClick { showingTextfield = true }
                        .padding(.top, 25)
                    
                }
                .ignoresSafeArea()
                
                if showingTextfield {
                    EditProfileInfoView(name: $name)
                        .onDeleteClick {
                            image = nil
                            inputImage = UIImage()
                        }
                        .onImageChange({ img in
                            inputImage = img
                            image = Image(uiImage: inputImage!)
                        })
                    .padding()
                    Button("Done") {
                        userVM.createorUpdateUser(user: UserModel(name: name != "" ? name : userVM.user.name, image: inputImage ?? userVM.user.image, transactions: []))
                        showingTextfield = false
                        
                    }
                    .padding()
                } else {
                    Text("Keep up the great job of tracking your expenses using our app!")
                        .font(.caption)
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .foregroundColor(.purple)
                        .padding([.leading, .trailing], 50)
                        .padding(.bottom, 300)
                }
            }
        }
        .ignoresSafeArea(.keyboard)
        .onAppear {
            userVM.fetchUserData()
            let user = userVM.user
            if(user.image.size.width==0){
                image = nil
            }
            else {
                image = Image(uiImage: user.image)
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
