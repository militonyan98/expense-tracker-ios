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
    
    var body: some View {
        VStack(alignment: .leading) {
            EditProfileNameView(userID: userID, name: $name)
            .padding(.bottom, 5)
            
            UploadProfileImageView(showingImagePicker: $showingImagePicker)
            
            //Spacer()
        }
        
        Spacer()
    }
}

//struct EditProfileInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileInfoView()
//    }
//}
