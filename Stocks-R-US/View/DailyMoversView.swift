//
//  DailyMovers.swift
//  Stocks-R-US
//
//  Created by Appakonam, Aashish on 11/28/22.
//

import Foundation
import SwiftUI

struct DailyMoversWidget: View
{
    var theStock: Stock
    
    func colorForChange( _ thePercentChange: Double ) -> String
    {
        if ( thePercentChange < 0 )
        {
            return "FF0000" // red
        }
        else
        {
            return "19A63C" // green
        }
            
    }
    
    var body: some View
    {

        VStack
        {
            Spacer()
            
            Text( "\(theStock.percentChange, specifier: "%.2f" )%" )
                .font( .system( size: 14 ) )
                .fontWeight( .regular )
                .foregroundColor( .white )
                .padding( .horizontal, 10.0 )
            
            Spacer()
            
            Text( "\(theStock.ticker)" )
                .font( .system( size: 14 ) )
                .fontWeight( .bold )
                .foregroundColor( .white )
                .padding( .horizontal, 10.0 )
            
            Spacer()
            
        }
        .background( Color( hex: colorForChange( theStock.percentChange ) ) )
        .cornerRadius( 40.0 )
        .padding( .horizontal, 10.0 )
    }
    
}
