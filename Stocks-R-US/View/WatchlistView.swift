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
//            GeometryReader
//            { geo in
            
            ZStack
            {
                Color( hex: "F17968" )  // background color
                    .ignoresSafeArea()

            
                VStack
                {
                    
                    // Daily Movers Widget
                    Text( "Daily Movers" )
                        .foregroundColor( .black )
                        .font( .title2 )
                        .fontWeight( .bold )
                        .frame( maxWidth: .infinity, alignment: .leading )
                        .padding( .horizontal, 30.0 )
                        .padding( .top, 15.0 )
                    
     
                    HStack( alignment: .center )
                    {
                        ForEach( theWatchlist.dailyMovers )
                        { aStock in
                            
                            HStack
                            {
                                VStack
                                {
                                    Spacer()
                                    
                                    Text( "\(aStock.percentChange, specifier: "%.2f" )%" )
                                        .font( .system( size: 18) )
                                        .fontWeight( .regular )
                                        .foregroundColor( .black )
                                        .padding( .horizontal, 15.0 )
                                    
                                    Spacer()
                                    
                                    Text( "\(aStock.ticker)" )
                                        .font( .system( size: 18) )
                                        .fontWeight( .bold )
                                        .foregroundColor( .black )
                                        .padding( .horizontal, 15.0 )
                                    
                                    Spacer()
                                    
                                }
                                .background( .green )
                                .cornerRadius( 40.0 )
                                .padding( .horizontal, 15.0 )
                            }
                            
                        }
                    }
                    .padding( 20 )
                    .background( Color( hex: "E3ADA5" ) )
                    .cornerRadius( 20.0 )

                    
                
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
                                   // TODO: Implement code to add

                                    print( "adding...")
                                }
                                else
                                {
                                     // Alert message to inform user if there no valid input is given
                                     let invalidInputAlert = UIAlertController(title: "Data Input Error", message: "Enter a valid Ticker to add to your watchlist.", preferredStyle: .alert)

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
                        .font( Font.system( size: 20) )
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
                        .font( Font.system( size: 20) )
                        .buttonStyle( .borderedProminent )
                        .foregroundColor( .black )
                        .tint( Color( hex: "E3ADA5" ) )
                        .buttonBorderShape( .capsule )
                        .frame( height: 100, alignment: .center )
                        .alert( "Sort Options", isPresented: $showingSort ) {
                            Button( "Ticker Symbol" )
                            {
                                // TODO: Implement
                                print( "[HomeView] Sorting by Ticker Symbol")
                            }
                            Button( "Price" )
                            {
                                // TODO: Implement
                                print( "[HomeView] Sorting by Price")
                            }
                            Button( "Volume" )
                            {
                                // TODO: Implement
                                print( "[HomeView] Sorting by Volume")
                            }
                            Button( "Percentage" )
                            {
                                // TODO: Implement
                                print( "[HomeView] Sorting by Percentage")
                            }
                        }
                        
                        Spacer()

                    }
                    
                    Spacer() 
                    
                    // Stock Cards List
                    List( theWatchlist.stocks )
                    { aStock in
                        NavigationLink( destination : StockView( /* TODO: Esvar's part to implement */ ) )
                        {
                            ScrollView()
                            {
                                VStack
                                {
                                    HStack
                                    {
                                        
                                        VStack
                                        {
                                            Spacer()
                                            
                                            Text( "\(aStock.ticker)" )
                                                .font( .system( size: 20) )
                                                .fontWeight( .bold )
                                                .foregroundColor( .black ) // TODO: change to Color( "E3ADA5" )
                                            
                                            Spacer()
                                            
                                            Text( "\(aStock.company)" )
                                                .font( .system( size: 14) )
                                                .fontWeight( .light )
                                                .foregroundColor( .black )
                                        }
                                        
                                        Spacer()
                                        
                                        Text( "\(aStock.price, specifier: "%.2f" )" )
                                            .font( .system( size: 18) )
                                            .fontWeight( .semibold )
                                            .foregroundColor( .black )
                                        
                                        Spacer()
                                        
                                        Text( "\(aStock.percentChange, specifier: "%.2f" )%" )
                                            .font( .system( size: 18) )
                                            .fontWeight( .regular )
                                            .foregroundColor( .blue ) // TODO: change to white with colored box
                                        
                                        Spacer()
                                    } // HStack end
                                    
                                } // VStack end
                            }
                        }
                    } // List end
                    
                } // VStack end


            
                
    //            } // GeometryReader end
                
            } // ZStack end
                
              
                
        } // NavigationView end
        .navigationBarBackButtonHidden()
        .navigationBarTitle( Text( "Watchlist" ) )
        .navigationBarTitleDisplayMode( .large )  // Aash -> TODO: Implement custom navbar to include shape, this is fine for now.
        .navigationBarHidden( false )

    }
}

struct WatchlistView_Previews: PreviewProvider
{
    static var previews: some View
    {
        WatchlistView( userViewModel: .constant( UserViewModel() ) )
    }
}
