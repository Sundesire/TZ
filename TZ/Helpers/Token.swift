//
//  Token.swift
//  TZ
//
//  Created by Иван Бабушкин on 10.03.2020.
//  Copyright © 2020 Ivan Babushkin. All rights reserved.
//

import Foundation

struct Token {
    static let token = "token"
}

class Helper {
    func saveToken(token: String) {
        let defaults = UserDefaults.standard
        defaults.set(token, forKey: Token.token)
    }
    
    func getToken() -> String? {
        let defaults = UserDefaults.standard
        if let token = defaults.string(forKey: Token.token) {
            return token
        }
        return nil
    }
}
