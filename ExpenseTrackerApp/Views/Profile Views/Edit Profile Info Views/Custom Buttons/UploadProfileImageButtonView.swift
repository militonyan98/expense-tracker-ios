//
//  UploadProfileImageView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct UploadProfileImageButtonView: View {
    var onClick: (() -> Void)?
    
    var body: some View {
        CustomEditProfileButtonView(onClick: onClick, label: "Upload a photo", icon: "photo.on.rectangle")
    }
}

extension UploadProfileImageButtonView {
    func onClick(_ handler: @escaping () -> Void) -> UploadProfileImageButtonView {
        var new = self
        new.onClick = handler
        return new
    }
}

//struct UploadProfileImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadProfileImageView()
//    }
//}
