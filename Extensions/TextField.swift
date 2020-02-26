//
//  TextField.swift
//  Authentication
//
//  Created by David Sarkisyan on 26.02.2020.
//  Copyright © 2020 DavidS & that's all. All rights reserved.
//

import UIKit



extension UITextField{
    public func isCorrect(key: String) -> Bool{
        let userDefualts = UserDefaults.standard
        
        if let userData = userDefualts.string(forKey: key), userData == text{
            return true
        }else {
            return false
        }
    }
}
