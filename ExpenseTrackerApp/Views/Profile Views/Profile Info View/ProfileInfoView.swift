//
//  ProfileInfoView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct ProfileInfoView: View {
    @Binding var image: Image?
    let name: String
    
    var onEditClick: (() -> Void)?
    
    var body: some View {
        VStack {
            ProfileImageView(image: $image)
            
            ProfileNameView(name: name)
                .onEditClick { onEditClick?() }
                .padding(10)
            
            Spacer()
        }
        .foregroundColor(.white)
    }
}

extension ProfileInfoView {
    func onEditClick(_ handler: @escaping () -> Void) -> ProfileInfoView {
        var new = self
        new.onEditClick = handler
        return new
    }
}

//struct ProfileInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileInfoView()
//    }
//}
