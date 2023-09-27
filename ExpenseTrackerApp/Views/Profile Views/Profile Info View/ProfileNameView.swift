//
//  ProfileNameView.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 12.5.23..
//

import SwiftUI

struct ProfileNameView: View {
    let name: String
    @Binding var showingTextfield: Bool
    
    var body: some View {
        HStack {
            Text(name != "" ? name.uppercased() : "Your name".uppercased())
                .font(.headline)
                .bold()
            Image(systemName: "pencil")
                .onTapGesture {
                    showingTextfield = true
                }
        }
    }
}

//struct ProfileNameView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileNameView()
//    }
//}
