//
//  ProfileNameView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct ProfileNameView: View {
    let name: String
    
    var onEditClick: (() -> Void)?
    
    var body: some View {
        HStack {
            Text(name != "" ? name.uppercased() : "Your name".uppercased())
                .font(.headline)
                .bold()
            Image(systemName: "pencil")
                .onTapGesture { onEditClick?() }
        }
    }
}

extension ProfileNameView {
    func onEditClick(_ handler: @escaping () -> Void) -> ProfileNameView {
        var new = self
        new.onEditClick = handler
        return new
    }
}

//struct ProfileNameView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileNameView()
//    }
//}
