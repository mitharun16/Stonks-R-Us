//
//  StocklistView.swift
//  Stocks-R-US
//
//  Created by Appakonam, Aashish on 11/28/22.
//

import Foundation
import SwiftUI

struct StocklistView: View
{
    var aStock: Stock
    
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
        HStack
        {
            
            VStack( alignment: .leading )
            {
                Spacer()
                
                Text( "\(aStock.ticker)" )
                    .font( .system( size: 20) )
                    .fontWeight( .bold )
                    .foregroundColor( Color( hex: "E3ADA5" ) )
                
                Spacer()
                
                Text( "\(aStock.company)" )
                    .font( .system( size: 12) )
                    .fontWeight( .light )
                    .foregroundColor( .black )
            }
            
            Spacer()
            
            Text( "\(aStock.price, specifier: "%.2f" )" )
                .font( .system( size: 16) )
                .fontWeight( .semibold )
                .foregroundColor( .black )
            
            Spacer()
            
            Text( "\(aStock.percentChange, specifier: "%.2f" )%" )
                .font( .system( size: 16) )
                .fontWeight( .regular )
//                .foregroundColor( .blue )
                .foregroundColor( Color( hex: colorForChange( aStock.percentChange ) ) )
            
            Spacer()
        } // HStack end
        
    }
    
}
