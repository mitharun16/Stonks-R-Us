//
//  Stock.swift
//  Stocks-R-US
//
//  Created by Appakonam, Aashish on 11/10/22.
//

import Foundation

class Stock: Identifiable
{
    var ticker: String
    var company: String
    var price: Double
    var percentChange: Double
    var change: Double
    var volume: Double
    var dayLowHighOpen: Double
    var dayLowHighClose: Double
    var weekHighOpen: Double
    var weekLowHighClose: Double
    
    
    
    init( ticker: String, company: String, price: Double, percentageChange: Double, change: Double, volume: Double, dayLowHighOpen: Double, dayLowHighClose: Double, weekHighOpen: Double, weekLowHighClose: Double)
    {
        self.ticker = ticker
        self.company = company
        self.price = price
        self.percentChange = percentageChange
        self.change = change
        self.volume = volume
        self.dayLowHighOpen = dayLowHighOpen
        self.dayLowHighClose = dayLowHighClose
        self.weekHighOpen = weekHighOpen
        self.weekLowHighClose = weekLowHighClose
    }
}

