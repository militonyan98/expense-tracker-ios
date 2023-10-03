//
//  EditProfileNameView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct EditProfileNameView: View {
    @EnvironmentObject var userVM: UserViewModel
    let userID: UUID
    @Binding var name: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Edit your info:")
                .fontWeight(.semibold)
                .foregroundColor(.indigo)
                .padding(.leading, 5)
            TextField("Name", text: $userVM.user.name)
                .textFieldStyle(CustomTextFieldStyle())
                .textCase(.uppercase)
                .autocorrectionDisabled()
                .lineLimit(1)
                .limitInputLength(value: $name, length: 25)
                .submitLabel(.done)
        }
    }
}

//struct EditProfileNameView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileNameView()
//    }
//}
