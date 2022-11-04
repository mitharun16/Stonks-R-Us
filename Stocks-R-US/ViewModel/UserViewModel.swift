//
//  UserViewModel.swift
//  Stocks-R-US
//
//  Created by Tharun Imayavaramban on 11/3/22.
//

import Foundation
class UserViewModel
{
    var user:User
    init()
    {
        user = User(username: "", password: "", email: "")
    }
    
    func createAccount(emailAddress: String, username:String, password:String)
    {
        self.user = User(username: username, password: password, email: emailAddress)
    }
    func checkLogin(username:String, password:String) -> Bool
    {
        if(username == "admin" && password == "test")
        {
            return true
        }
        else
        {
            return false
        }
        
    }
}
