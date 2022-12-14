//
//  Stocks_R_USApp.swift
//  Stocks-R-US
//
//  Created by Tharun Imayavaramban on 11/1/22.
//

import SwiftUI

@main
struct Stocks_R_USApp: App {
    var body: some Scene {
        WindowGroup {
//            SplashView()
            
            // for dev purposes skip login screens and go directly to HomeView
            // TODO: Change back to SplashView when app is complete or for debug build
            WatchlistView( userViewModel: .constant( UserViewModel() ) )
        }
        
    }
    
}
