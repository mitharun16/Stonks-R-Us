//
//  WelcomeView.swift
//  Stocks-R-US
//
//  Created by Tharun Imayavaramban on 11/3/22.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}



struct WelcomeView: View {
    @State var showDetail: Bool = false
    @State private var isPresentedSignIn = false
    @State private var isPresentedSignUp = false
    @State private var emailAddress = ""
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        NavigationView
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
                        
                    
                    Color(hex: "F17968")
                        .ignoresSafeArea()
                        .opacity(0.5)
                    VStack
                    {
                        
                        
                        
                        VStack
                        {
                            Image("LogoCircular")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 350)
                                .cornerRadius(25)
                                .padding(20)
                            
                        }

                            // Sign Up Button
                        NavigationLink("Sign Up", destination: SignUpView().navigationBarBackButtonHidden())
                            
                            
                        
                        
                            .fontWeight(.bold)
                            .font(Font.system(size: 20))
                            .buttonStyle(.borderedProminent)
                            .foregroundColor(.white)
                            .tint(.pink)
                            .buttonBorderShape(.capsule)
                            .frame(height: 100, alignment: .center)
                           
                            // Sign in Button
                        NavigationLink("Sign In", destination: LoginView().navigationBarBackButtonHidden())
                            
                            .fontWeight(.bold)
                            .font(Font.system(size: 20))
                            .buttonStyle(.borderedProminent)
                            .foregroundColor(.white)
                            .tint(.pink)
                            .buttonBorderShape(.capsule)
                            .frame(height: 100, alignment: .center)
                                                   
                    }
                    
                }
              
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
