//
//  SignUpView.swift
//  Stocks-R-US
//
//  Created by Tharun Imayavaramban on 11/3/22.
//

import SwiftUI


struct SignUpView: View {
    @State var userViewModel: UserViewModel = UserViewModel()
    @State private var emailAddress = ""
    @State private var username = ""
    @State private var password = ""
    @State private var showHomeScreen = false
    @State private var missingFields = false
    @State private var invalidEmail = false
    @State private var error = false
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
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
                            
                            TextField("email", text: $emailAddress, prompt: Text("Enter Your Email")
                                .foregroundColor(Color.white))
                                .padding()
                                .frame(width: 300, alignment: .center)
                                .background(LinearGradient(colors: [.white.opacity(0.5), .pink.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing), in: Capsule())
                                .overlay(Capsule().stroke(Color(hex: "E3ADA5")))
                                .keyboardType(.emailAddress)
                            
                            TextField("username", text: $username, prompt: Text("Create Your Username")
                                .foregroundColor(Color.white))
                                .padding()
                                .frame(width: 300, alignment: .center)
                                .background(LinearGradient(colors: [.white.opacity(0.5), .pink.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing), in: Capsule())
                                .overlay(Capsule().stroke(Color(hex: "E3ADA5")))
                            
                            SecureField("password", text: $password, prompt: Text("Create Your Password")
                                .foregroundColor(Color.white))
                                .padding()
                                .frame(width: 300, alignment: .center)
                                .background(LinearGradient(colors: [.white.opacity(0.5), .pink.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing), in: Capsule())
                                .overlay(Capsule().stroke(Color(hex: "E3ADA5")))

                            
                           HStack
                            {
                                NavigationLink(destination: WelcomeView().navigationBarBackButtonHidden(), label: {
                                    Text("Cancel")
                                })
                                .fontWeight(.bold)
                                .font(Font.system(size: 20))
                                .buttonStyle(.borderedProminent)
                                .foregroundColor(.white)
                                .tint(.pink)
                                .buttonBorderShape(.capsule)
                                .frame(height: 100, alignment: .center)
                                .padding()
                                
                                Button
                                {
                                    if (emailAddress.isEmpty || username.isEmpty || password.isEmpty)
                                    {
                                        error = true
                                        missingFields = true
                                    }
                                    else
                                    {
                                        missingFields = false
                                        error = false
                                        if(!isValidEmail(emailAddress))
                                        {
                                            error = true
                                            invalidEmail = true
                                        }
                                        else
                                        {
                                            showHomeScreen = userViewModel.createAccount(emailAddress: emailAddress, username: username, password: password)
                                            if(!showHomeScreen)
                                            {
                                                error = true
                                            }
                                        }
                                    }
                                    
                                } label: {
                                    Text("Sign Up")
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
                                        return Alert(title: Text("Missing Information"),message: Text("Make sure that all fields are completed and try again."),dismissButton: .default(Text("Got It!")))
                                    }
                                    else if invalidEmail
                                    {
                                        return Alert(title: Text("Invalid Email"),message: Text("Make sure the email entered is valid."),dismissButton: .default(Text("Got It!")))
                                    }
                                    else
                                    {
                                         return Alert(title: Text("Account Exists"),message: Text("Can't create a new account. Account already exists please log in."),dismissButton: .destructive(Text("Ok")))
                                    }
                                    
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
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
