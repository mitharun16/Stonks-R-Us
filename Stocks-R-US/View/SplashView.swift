//
//  SplashView.swift
//  Stocks-R-US
//
//  Created by Tharun Imayavaramban on 11/3/22.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive
        {
            WelcomeView()
        }
        else
        {
            GeometryReader {
                geo in ZStack
                {
                    Image("splashscreenbackground")
                                            .resizable()
                                            .scaledToFill()
                                            .edgesIgnoringSafeArea(.all)
                                            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                                            .opacity(1.0)
                    VStack
                    {
                        VStack
                        {
                            Image("LogoCircular")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300)
                                .cornerRadius(25)
                        }
                        .onAppear
                        {
                            withAnimation(.easeIn(duration: 1.2))
                            {
                                self.size = 0.9
                                self.opacity = 1.0
                                
                            }
                        }
                        
                    }
                    .onAppear
                    {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            self.isActive = true
                        }
                    }
                }
            }
            
           
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
