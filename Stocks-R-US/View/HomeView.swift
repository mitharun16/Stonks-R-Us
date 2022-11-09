//
//  HomeView.swift
//  Stocks-R-US
//
//  Created by Tharun Imayavaramban on 11/3/22.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            VStack
            {
                Text("Stonks to the Moon!!!")
            }
            .navigationBarBackButtonHidden()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userViewModel: .constant(UserViewModel()))
    }
}
