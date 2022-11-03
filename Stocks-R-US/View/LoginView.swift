//
//  LoginView.swift
//  Stocks-R-US
//
//  Created by Tharun Imayavaramban on 11/3/22.
//

import SwiftUI

struct LoginView: View {
    @Binding var userViewModel: UserViewModel
    var body: some View {
        Text("Sign in View")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(userViewModel: .constant(UserViewModel()))
    }
}
