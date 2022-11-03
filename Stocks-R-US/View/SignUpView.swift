//
//  SignUpView.swift
//  Stocks-R-US
//
//  Created by Tharun Imayavaramban on 11/3/22.
//

import SwiftUI

struct SignUpView: View {
    @Binding var userViewModel: UserViewModel
    var body: some View {
        Text("Sign Up View")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(userViewModel: .constant(UserViewModel()))
    }
}
