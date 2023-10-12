//
//  DeleteProfileImageButtonView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.10.23..
//

import SwiftUI

struct DeleteProfileImageButtonView: View {
    var onClick: (() -> Void)?
    
    var body: some View {
        CustomEditProfileButtonView(onClick: onClick, label: "Delete the photo", icon: "trash.fill", color: .red)
    }
}

extension DeleteProfileImageButtonView {
    func onClick(_ handler: @escaping () -> Void) -> DeleteProfileImageButtonView {
        var new = self
        new.onClick = handler
        return new
    }
}

#Preview {
    DeleteProfileImageButtonView()
}
