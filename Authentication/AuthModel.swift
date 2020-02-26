//
//  AuthModel.swift
//  Authentication
//
//  Created by David Sarkisyan on 25.02.2020.
//  Copyright © 2020 DavidS & that's all. All rights reserved.
//

public struct Login{
    var login: String?
    var password: String?
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}
