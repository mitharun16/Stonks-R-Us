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

    @State var aStock: Stock
    
    func color() -> String
    {
        if (aStock.percentChange < 0)
        {
            return "FF0000"
        }
            
        else
        {
            return "00FF00"
        }
            

    }
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
                                     Text( "\(aStock.change, specifier: "%.2f" )" ).foregroundColor(Color(.white))
                                     Text( "|" ).foregroundColor(Color(.white))
                                     Text( "\(aStock.percentChange, specifier: "%.2f" )%" ).foregroundColor(Color(.white))
                                 }
                                 .padding()
                                 .background(Color(hex: color()))
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
                                         Text("Week Low/High").underline(color:Color(.white))
                                         
                                         Text("Open: "+String(aStock.weekHighOpen))
                                         Text("Close: "+String(aStock.weekLowHighClose))
                                     }.padding()
                                         .background( Color( hex: "F17968" ) )
                                         .cornerRadius( 20.0 )
                                 }
                                 Text("Last Updated: " + getCurrentTime())
                                     .font( .system( size: 14 ) )
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
                     VStack
                     {
                         Text( aStock.newsTitle )
                             .bold()
                         // .font(.system(size: 25))
                         Spacer()
                         Text( aStock.newsDescription )
                         Spacer()
                        Link( "Read More", destination: URL( string: aStock.newsLink )! )
                     }
                     .padding( 15.0 )

                 }
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
        StockView(aStock: Stock( ticker: "AAPL", company: "Apple Inc.", price: 147.27, percentageChange: 2.53, change: 3.50, volume: 63.12, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32 ))
    }
}
