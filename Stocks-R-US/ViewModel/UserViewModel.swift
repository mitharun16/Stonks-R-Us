//
//  UserViewModel.swift
//  Stocks-R-US
//
//  Created by Tharun Imayavaramban on 11/3/22.
//

import Foundation

class UserViewModel
{
    var user: User
    
    init()
    {
        user = User(username: "", password: "", email: "")
    }
    
    func createAccount(emailAddress: String, username:String, password:String) -> Bool
    {
        self.user = User(username: username, password: password, email: emailAddress)
        return true
    }
    
    func checkLogin(username:String, password:String) -> Bool
    {
        if(username == "Admin" && password == "test")
        {
            return true
        }
        else
        {
            return false
        }
        
    }
}
