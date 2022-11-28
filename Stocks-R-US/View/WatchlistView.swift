//
//  HomeView.swift
//  Stocks-R-US
//
//  Created by Tharun Imayavaramban on 11/3/22.
//

import SwiftUI

struct WatchlistView: View
{
    
    @Binding var userViewModel: UserViewModel
    @State private var showingSort = false
    @StateObject var theWatchlist = WatchlistViewModel()
    
   
    var body: some View
    {
        
        NavigationView
        {
            GeometryReader
            { geo in
            
            
                ZStack
                {
                    
                    
                    Color( hex: "F17968" )  // background color
                        .ignoresSafeArea()
                    
                    
                    VStack
                    {
                        NavBarOverlay( theTitle: "Watchlist" )

                        // Daily Movers Widget
                        Group
                        {
                            Text( "Daily Movers" )
                                .foregroundColor( .black )
                                .font( .title2 )
                                .fontWeight( .bold )
                                .frame( maxWidth: .infinity, alignment: .leading )
                                .padding( .leading, 30.0 )
                                .padding( .top, 5.0 )
                            
                            Group
                            {
                                
                                
                                HStack( alignment: .center )
                                {
                                    ForEach( theWatchlist.dailyMovers )
                                    { aStock in
                                        HStack
                                        {
                                            DailyMoversWidget( theStock: aStock )
                                        }
                                    }
                                }
//                                .padding( 20.0 )
                                .padding( .horizontal, 20.0 )
                                .padding( .top, 1.0 )
                                .background( Color( hex: "E3ADA5" ) )
                                .cornerRadius( 20.0 )
                                .frame( height: geo.size.height * 0.20 )
                            }
                            
                        } // Group end
                        .padding( .horizontal, 20.0 )
                        
                    
                        // Add and Sort buttons
                        HStack
                        {
                            Spacer()
                            
                            // Add Button
                            Button
                            {
                                
                                // uses an alert controller to get inputted inputted Ticker to add
                                let addAlertController = UIAlertController( title: "Add a Stock", message: "Enter the Ticker symbol of the Stock you would like to add to your watchlist.", preferredStyle: .alert )
                                let addAction = UIAlertAction(title: "Add", style: .default) { (aciton) in
                                    let theNameInput = addAlertController.textFields![0]

                                    if !( (theNameInput.text?.isEmpty)! )
                                    {
                                        print( "adding...")
                                        let theAddResult = theWatchlist.add( newName: theNameInput.text ?? "Error" )
                                        
                                        if (!theAddResult)
                                        {
                                            // Alert message to inform user that stock was not added
                                            let invalidInputAlert = UIAlertController(title: "Invalid Stock Entry", message: "Stock with this ticker could not be found. Enter a valid Ticker to add to your watchlist.", preferredStyle: .alert)

                                             invalidInputAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

                                            let viewController = UIApplication.shared.windows.first!.rootViewController!
                                            viewController.present( invalidInputAlert, animated: true, completion: nil )
                                        }
                                    
                                    }
                                    else
                                    {
                                         // Alert message to inform user if there no valid input is given
                                         let invalidInputAlert = UIAlertController(title: "Data Input Error", message: "Enter a valid Ticker to add to your watchlist. Input cannot be empty.", preferredStyle: .alert)

                                          invalidInputAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

                                         let viewController = UIApplication.shared.windows.first!.rootViewController!
                                         viewController.present( invalidInputAlert, animated: true, completion: nil )
                                    }

                                }

                                let cancelAction = UIAlertAction( title: "Cancel", style: .cancel ) { (action) in
                                }

                                addAlertController.addTextField { ( textField ) in
                                    textField.placeholder = "Enter Ticker symobol here"
                                    textField.keyboardType = .alphabet
                                }


                                addAlertController.addAction( addAction )
                                addAlertController.addAction( cancelAction )

                                let viewController = UIApplication.shared.windows.first!.rootViewController!
                                viewController.present( addAlertController, animated: true, completion: nil )

                            } label: {
                                Text( "Add" )
                            }
                            .fontWeight( .bold )
                            .font( Font.system( size: 18) )
                            .buttonStyle( .borderedProminent )
                            .foregroundColor( .black )
                            .tint( Color( hex: "E3ADA5" ) )
                            .buttonBorderShape( .capsule )
                            .frame( height: 100, alignment: .center )
                            
                            
                            Spacer()
                            
                            // Sort Button
                            Button
                            {
                                showingSort = true
                            } label: {
                                Text( "Sort" )
                            }
                            .fontWeight( .bold )
                            .font( Font.system( size: 18) )
                            .buttonStyle( .borderedProminent )
                            .foregroundColor( .black )
                            .tint( Color( hex: "E3ADA5" ) )
                            .buttonBorderShape( .capsule )
                            .frame( height: 100, alignment: .center )
                            .alert( "Sort Options", isPresented: $showingSort )
                            {
                                Button( "Ticker Symbol" )
                                {
                                    theWatchlist.choosenSort = .TICKER
                                    theWatchlist.sort()
                                    print( "[HomeView] Sorting by Ticker Symbol")
                                }
                                Button( "Price" )
                                {
                                    theWatchlist.choosenSort = .PRICE
                                    theWatchlist.sort()
                                    print( "[HomeView] Sorting by Price")
                                }
                                Button( "Volume" )
                                {
                                    theWatchlist.choosenSort = .VOLUME
                                    theWatchlist.sort()
                                    print( "[HomeView] Sorting by Volume")
                                }
                                Button( "Percentage" )
                                {
                                    theWatchlist.choosenSort = .PERCENTAGE
                                    theWatchlist.sort()
                                    print( "[HomeView] Sorting by Percentage")
                                }
                            }
                            
                            Spacer()

                        }
                        
                        Spacer()
       
                        // Stock Cards List
                        List( theWatchlist.stocks )
                        { aStock in
                            NavigationLink( destination : StockView( aStock: aStock ) )
                            {
                                ScrollView()
                                {
                                    VStack
                                    {
                                        StocklistView( aStock: aStock )
                                    } // VStack end
                                }
                            }
                        } // List end
                        
                    } // VStack end

            
                
                } // GeometryReader end
                
            } // ZStack end
                
              
                
        } // NavigationView end
        .navigationBarBackButtonHidden()

    }
}

struct WatchlistView_Previews: PreviewProvider
{
    static var previews: some View
    {
        WatchlistView( userViewModel: .constant( UserViewModel() ) )
    }
}
