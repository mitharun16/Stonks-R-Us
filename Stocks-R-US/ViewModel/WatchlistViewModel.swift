//
//  WatchlistViewModel.swift
//  Stocks-R-US
//
//  Created by Appakonam, Aashish on 11/10/22.
//

import Foundation

class WatchlistViewModel: ObservableObject
{
    
    @Published var stocks = [Stock]()
    @Published var dailyMovers = [Stock]()
    
    init()
    {
        // preloaded stocks for testing
        let test1 = Stock(ticker: "AAPL", company: "Apple Inc.", price: 147.27, percentageChange: 2.53, volume: 85.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32)
        let test2 = Stock(ticker: "META", company: "Meta Platforms Inc.", price: 130.01, percentageChange: -1.16, volume: 85.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32)
       
        stocks.append( test1 )
        stocks.append( test2 )
        stocks.append( test1 )
        stocks.append( test2 )
        stocks.append( test1 )
        stocks.append( test2 )
        stocks.append( test1 )
        stocks.append( test2 )
        stocks.append( test1 )
        stocks.append( test2 )
        
        
        let temp1 = Stock(ticker: "Dow", company: "Dow Jones", price: 147.27, percentageChange: 1.2, volume: 85.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32)
        let temp2 = Stock(ticker: "S&P 500", company: "S&P 500", price: 147.27, percentageChange: -4.8, volume: 85.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32)
        let temp3 = Stock(ticker: "Nasdaq", company: "Nasdaqes", price: 147.27, percentageChange: 3.6, volume: 85.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32)
        
        dailyMovers.append( temp1 )
        dailyMovers.append( temp2 )
        dailyMovers.append( temp3 )
        
    }
    
    
}
