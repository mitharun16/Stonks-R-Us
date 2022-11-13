//
//  NavBarOverlay.swift
//  Stocks-R-US
//
//  Created by Appakonam, Aashish on 11/12/22.
//

import Foundation
import SwiftUI

struct NavBarOverlay: View
{
    var theTitle: String?

    var body: some View
    {
        HStack
        {
            Spacer()
            
            Text( theTitle ?? "No Title Given" )
                .font( .largeTitle.weight( .bold ) )
                .frame( maxWidth: .infinity, alignment: .center )
                .padding( .horizontal, 20.0 )
                .background( .black )
                .foregroundColor( Color( hex: "E3ADA5" ) )
                .cornerRadius( 10.0 )
            
            Spacer()
            
            Image( "LogoSmaller" )
                .scaledToFit()
                .frame( width: 30.0, height: 50.0, alignment: .center )
                .opacity( 1.0 )
                .padding( .trailing, 20.0 )
                .cornerRadius( 10.0 )
            
            Spacer()
        }
    }
    
}
