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
    @Published var choosenSort: SortType = .TICKER
    
    enum SortType {
        case TICKER, PRICE, VOLUME, PERCENTAGE
    }
    
    init()
    {
        // preloaded stocks for testing
        let test1 = Stock( ticker: "AAPL", company: "Apple Inc.", price: 147.27, percentageChange: 2.53, volume: 63.12, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32 )
        let test2 = Stock( ticker: "META", company: "Meta Platforms Inc.", price: 130.01, percentageChange: -1.16, volume: 83.96, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32 )
        let test3 = Stock( ticker: "GOOGL", company: "Alphabet Inc.", price: 230.01, percentageChange: 0.56, volume: 56.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32 )
        let test4 = Stock( ticker: "AMZN", company: "Amazon Inc.", price: 1300.31, percentageChange: -4.16, volume: 23.56, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32 )
        let test5 = Stock( ticker: "TSLA", company: "Telsa Inc.", price: 420.32, percentageChange: 2.01, volume: 69.69, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32 )
       
       
        stocks.append( test1 )
        stocks.append( test2 )
        stocks.append( test3 )
        stocks.append( test4 )
        stocks.append( test5 )
        
        
        let temp1 = Stock(ticker: "Dow", company: "Dow Jones", price: 147.27, percentageChange: 1.2, volume: 85.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32)
        let temp2 = Stock(ticker: "S&P 500", company: "S&P 500", price: 147.27, percentageChange: -4.8, volume: 85.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32)
        let temp3 = Stock(ticker: "Nasdaq", company: "Nasdaqes", price: 147.27, percentageChange: 3.6, volume: 85.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32)
        
        dailyMovers.append( temp1 )
        dailyMovers.append( temp2 )
        dailyMovers.append( temp3 )
        
    }
    
    func add( newName: String )
    {
        // TOCO: implement query
        let toAdd = Stock(ticker: newName , company: "Testing", price: 147.27, percentageChange: 2.53, volume: 85.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32)
        stocks.append( toAdd )
    }
    
    
    func sort()
    {
        if ( choosenSort == .TICKER )
        {
            stocks = stocks.sorted( by: { $0.ticker < $1.ticker } )
        }
        else if ( choosenSort == .PRICE )
        {
            stocks = stocks.sorted( by: { $0.price < $1.price } )
        }
        else if ( choosenSort == .PERCENTAGE )
        {
            stocks = stocks.sorted( by: { $0.percentChange < $1.percentChange } )
        }
        else if ( choosenSort == .VOLUME )
        {
            stocks = stocks.sorted( by: { $0.volume < $1.volume } )
        }
        
    }
    
    
}
