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
        //  preloaded stocks for testing - THIS IS THE OLD WAY of doing it
//        let test1 = Stock( ticker: "AAPL", company: "Apple Inc.", price: 147.27, percentageChange: 2.53, change: 3.50, volume: 63.12, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32 )
//        let test2 = Stock( ticker: "META", company: "Meta Platforms Inc.", price: 130.01, percentageChange: -1.16, change: 3.50, volume: 83.96, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32 )
//        let test3 = Stock( ticker: "GOOGL", company: "Alphabet Inc.", price: 230.01, percentageChange: 0.56, change: 3.50, volume: 56.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32 )
//        let test4 = Stock( ticker: "AMZN", company: "Amazon Inc.", price: 1300.31, percentageChange: -4.16, change: 3.50, volume: 23.56, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32 )
//        let test5 = Stock( ticker: "TSLA", company: "Telsa Inc.", price: 420.32, percentageChange: 2.01, change: 3.50, volume: 69.69, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32 )
//
//        stocks.append( test1 )
//        stocks.append( test2 )
//        stocks.append( test3 )
//        stocks.append( test4 )
//        stocks.append( test5 )


//        let temp1 = Stock(ticker: "VTI", company: "Dow Jones", price: 147.27, percentageChange: 1.2, change: 3.50, volume: 85.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32)
//        let temp2 = Stock(ticker: "SPY", company: "S&P 500", price: 147.27, percentageChange: -4.8, change: 3.50, volume: 85.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32)
//        let temp3 = Stock(ticker: "NDAQ", company: "Nasdaqes", price: 147.27, percentageChange: 3.6, change: 3.50, volume: 85.55, dayLowHighOpen: 142.87, dayLowHighClose: 147.26, weekHighOpen: 143.76, weekLowHighClose: 148.32)
//
//        dailyMovers.append( temp1 )
//        dailyMovers.append( temp2 )
//        dailyMovers.append( temp3 )
        
        add( newName: "VTI" )
        add( newName: "SPY" )
        add( newName: "NDAQ" )
        
        
    }
    
    func add( newName: String ) -> Bool
    {

        //let theUrl = URL( string: "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=IBM&apikey=demo" )!
        let theUrl = URL( string: "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=\(newName)&apikey=ICM86I2HS5LCNVE3" )!
        print( "The Stock URL: \(theUrl) \n" )
        let theUrlSession = URLSession.shared
        

        let theJsonQuery = theUrlSession.dataTask( with: theUrl, completionHandler: { data, response, error -> Void in
            if( error != nil )
            {
                print( error!.localizedDescription )
            }
            
            var err: NSError?
            var theJsonResult = ( try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers ) ) as! NSDictionary
            if( err != nil )
            {
                print( "Stock JSON Error \(err!.localizedDescription)" )
            }
            
            print( "Full Stock JSON response: " )
            print( theJsonResult )
            
            let theInfo = theJsonResult[ "Global Quote" ] as! NSDictionary
            
            if ( theInfo.count == 0 ) // checks to see if ticker exists by seeing if JSON response contains something
            {
                print( "Stock not found, could not add" )
                // return false
            }
            
            let theTicker = theInfo["01. symbol"] as! String
            let theOpen = Double( theInfo["02. open"] as! String )
            let theClose = Double( theInfo["08. previous close"] as! String )
            let theHigh = Double( theInfo["03. high"] as! String )
            let theLow = Double( theInfo["04. low"] as! String )
            let thePrice = Double( theInfo["05. price"] as! String )
            let theVolume = Double( theInfo["06. volume"] as! String )
            var percentChange = theInfo["10. change percent"] as! String
            let thePercentChange = Double( percentChange.dropLast() )
            let theChange = Double( theInfo["09. change"] as! String )
            
            let toAdd = Stock( ticker: theTicker , company: theTicker, price: thePrice ?? 0.0, percentageChange: thePercentChange ?? 0.0, change: theChange ?? 0.0, volume: theVolume ?? 0.0, dayLowHighOpen: theOpen ?? 0.0, dayLowHighClose: theClose ?? 0.0, weekHighOpen: theHigh ?? 0.0, weekLowHighClose: theLow ?? 0.0 )
            
            if ( newName == "VTI" || newName == "SPY" || newName == "NDAQ" )
            {
                self.dailyMovers.append( toAdd )
            }
            else
            {
                self.stocks.append( toAdd )
            }
            

        } )
    
        theJsonQuery.resume()
        
        self.addNewsInfo( ticker: newName )

        print( "Successfully Added Stock" )
        return true
    }
    
    func addNewsInfo( ticker: String )
    {

        let theUrl = URL( string: "https://api.marketaux.com/v1/news/all?symbols=\(ticker)&filter_entities=true&language=en&api_token=bYBiS1NslyG5ZMqRUB5TADYfVF215Th9Ots8UGZE" )!
        print( "The News URL: \(theUrl) \n" )
        let theUrlSession = URLSession.shared
        

        let theJsonQuery = theUrlSession.dataTask( with: theUrl, completionHandler: { data, response, error -> Void in
            if( error != nil )
            {
                print( error!.localizedDescription )
            }
            
            var err: NSError?
            var theJsonResult = ( try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers ) ) as! NSDictionary
            if( err != nil )
            {
                print( "JSON Error \(err!.localizedDescription)" )
            }
            
            print( "Full News JSON response: " )
            print( theJsonResult )
            
            let theInfo = theJsonResult[ "data" ] as! NSArray
//            print( "THE DATA: \(theInfo)" )
            
            let y = theInfo[0] as? [String: AnyObject]
            let theTitle: String = String((y!["title"] as? NSString) ?? "n/a")
            let theDescription: String = String((y!["description"] as? NSString) ?? "n/a")
            let theLink: String = String((y!["url"] as? NSString) ?? "n/a")
            
            self.stocks.last?.newsTitle = theTitle
            self.stocks.last?.newsDescription = theDescription
            self.stocks.last?.newsLink = theLink

        } )
    
        theJsonQuery.resume()
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
