//
//  DetailedStockView.swift
//  Stocks-R-US
//
//  Created by Appakonam, Aashish on 11/10/22.
//

import Foundation
import SwiftUI

struct StockView: View
{
    
    // TODO: Esvar's part to implement
    @State var aStock: Stock
    var body: some View
    {
        
        ZStack
        {
            Color( hex: "F17968" )  // background color
                .ignoresSafeArea()
            VStack
             {
                 NavBarOverlay(theTitle: aStock.ticker)
                 
                 Group
                 {
                     
                     HStack(){
                         Spacer()
                         
                         HStack()
                         {
                             VStack ()
                             {
                                 HStack(alignment: .top) {
                                     Text(aStock.company)
                                         .font(.system(size: 35))
                                         .bold()
                                         .foregroundColor(Color( hex: "F17968" ) )
                                     Spacer()
                                 }
                                 HStack(alignment: .top) {
                                     Text(aStock.ticker)
                                         .font(.system(size: 20))
                                     Spacer()
                                 }
                                 
                                 VStack(alignment: .center) {
                                     Text("$"+String(aStock.price))
                                         .bold()
                                         .font(.system(size: 35))
                                 }
                                 
                                 HStack{
                                     Text( "+0.35" ).foregroundColor(Color(.white))
                                     Text( "|" ).foregroundColor(Color(.white))
                                     Text( "+\(aStock.percentChange, specifier: "%.2f" )%" ).foregroundColor(Color(.white))
                                 }
                                 .padding()
                                 .background(.green)
                                 .frame(height: 28, alignment: .center)
                                 .cornerRadius(50)
                                 VStack(){
                                     Text("Volume").underline(color:Color(.white))
                                     Text(String(aStock.volume)+" mil")
                                 }.padding()

                                     .background( Color( hex: "F17968" ) )
                                     .cornerRadius( 20.0)
                                 HStack(){
                                     VStack(){
                                         Text("Day Low/High").underline(color:Color(.white))
                                         
                                         Text("Open: "+String(aStock.dayLowHighOpen))
                                         Text("Close: "+String(aStock.dayLowHighClose))
                                     }.padding()
                                         .background( Color( hex: "F17968" ) )
                                         .cornerRadius( 20.0 )
                                     VStack(){
                                         Text("52 Week Low/High").underline(color:Color(.white))
                                         
                                         Text("Open: "+String(aStock.weekHighOpen))
                                         Text("Close: "+String(aStock.weekLowHighClose))
                                     }.padding()
                                         .background( Color( hex: "F17968" ) )
                                         .cornerRadius( 20.0 )
                                 }
                                 Text("Last Updated: " + getCurrentTime())
                             }
                             
                             
                             
                             
                         }
                         .padding()
                         .background( Color( hex: "E3ADA5" ) )
                         .cornerRadius( 20.0 )
                         Spacer()
                     }
                 }
                 
                 ScrollView()
                 {
                     Text("First News Article")
                         .bold()
                        // .font(.system(size: 25))
                     Spacer()
                     Text("Evans Hankey was of two people promoted to oversee the design team after departure of Apple's longtime product designer")
                     Spacer()
                     Button("Read More")
                     {
                         
                     }
                     Spacer()
                     Text("Another News Article")
                         .bold()
                     Spacer()
                     Text("Evans Hankey was of two people promoted to oversee the design team after departure of Apple's longtime product designer")
                     Button("Read More")
                     {
                         
                     }
                 }
                 .padding()
                 .background( Color( hex: "E3ADA5" ) )
                 .cornerRadius( 20.0 )
             }
        }
       
    }
    func getCurrentTime() -> String
    {
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let dateInString = dateFormatter.string(from: date as Date)
        return dateInString
    }
}

struct  StockView_Previews: PreviewProvider
{
    static var previews: some View
    {
        StockView(aStock: Stock( ticker: "AAPL", company: "Apple Inc.", price: 147.27, percentageChange: 2.53, volume: 63.12, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32 ))
    }
}
