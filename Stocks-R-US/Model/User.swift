//
//  User.swift
//  Stocks-R-US
//
//  Created by Tharun Imayavaramban on 11/3/22.
//

import Foundation
class User
{
    let username: String
    let password:String
    let email:String
    init(username: String, password: String, email: String) {
        self.username = username
        self.password = password
        self.email = email
    }
}
