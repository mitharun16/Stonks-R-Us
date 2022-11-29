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
                .foregroundColor( Color( hex: "F17968" ) )
                .cornerRadius( 10.0 )
            
            Spacer()
            
            Image( "LogoSmaller" )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame( width: 50.0, height: 50.0, alignment: .center )
                .opacity( 1.0 )
                .cornerRadius( 13.0 )
            
            Spacer()
        }
    }
    
}
