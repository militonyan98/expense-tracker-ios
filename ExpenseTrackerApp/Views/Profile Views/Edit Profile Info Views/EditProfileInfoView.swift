//
//  EditProfileInfoView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct EditProfileInfoView: View {
    @Binding var name: String
    @Binding var showingImagePicker: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            EditProfileNameView(name: $name)
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
