//
//  LoginView.swift
//  Stocks-R-US
//
//  Created by Tharun Imayavaramban on 11/3/22.
//

import SwiftUI


struct LoginView: View {
    @State var userViewModel: UserViewModel = UserViewModel()
    @State private var username = ""
    @State private var password = ""
    @State private var showHomeScreen = false
    @State private var missingFields = false
    @State private var error = false
    
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
                            TextField("username", text: $username, prompt: Text("Enter Your Username").foregroundColor(Color.black))
                                .padding()
                                .frame(width: 300, alignment: .center)
                                .background(LinearGradient(colors: [.white.opacity(0.5), .pink.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing), in: Capsule())
                                .overlay(Capsule().stroke(Color(hex: "E3ADA5")))
                            SecureField("username", text: $password, prompt: Text("Enter Your Password").foregroundColor(Color.black))
                                .padding()
                                .frame(width: 300, alignment: .center)
                                .background(LinearGradient(colors: [.white.opacity(0.5), .pink.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing), in: Capsule())
                                .overlay(Capsule().stroke(Color(hex: "E3ADA5")))
                            
                            
                        }
                        HStack
                        {
                            NavigationLink(destination: WelcomeView().navigationBarBackButtonHidden(), label: {
                                Text("Go Back")
                            })
                            .fontWeight(.bold)
                            .font(Font.system(size: 20))
                            .buttonStyle(.borderedProminent)
                            .foregroundColor(.white)
                            .tint(.pink)
                            .buttonBorderShape(.capsule)
                            .frame(height: 100, alignment: .center)
                            .padding()
                            Button {
                                if(username.isEmpty || password.isEmpty)
                                {
                                    error = true
                                    missingFields = true
                                }
                                else
                                {
                                    missingFields = false
                                    error = false
                                    showHomeScreen = userViewModel.checkLogin(username: username, password: password)
                                    if(!showHomeScreen)
                                    {
                                        error = true
                                    }
                                    username = ""
                                    password = ""
                                }
                            } label: {
                                Text("Sign In")
                            }
                            
                            .fontWeight(.bold)
                            .font(Font.system(size: 20))
                            .buttonStyle(.borderedProminent)
                            .foregroundColor(.white)
                            .tint(.pink)
                            .buttonBorderShape(.capsule)
                            .frame(height: 100, alignment: .center)
                            .alert(isPresented: $error)
                            {
                                if missingFields
                                {
                                    return Alert(title: Text("Fill all Fields"),message: Text("Check if all textfields are filled"),dismissButton: .default(Text("Got It!")))
                                }
                                else
                                {
                                    return Alert(title: Text("Incorrect Username or Password"),message: Text("Either the username doesn't exist or the combination is incorrect. Please try again"),dismissButton: .destructive(Text("Try again")))
                                }
                            }
                            
                        }
                        NavigationLink(destination: HomeView(userViewModel: $userViewModel).navigationBarBackButtonHidden(), isActive: $showHomeScreen) {
                            EmptyView()
                        }
                        
                    }
                }
            }
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
