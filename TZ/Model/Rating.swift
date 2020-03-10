//
//  Rating.swift
//  TZ
//
//  Created by Иван Бабушкин on 10.03.2020.
//  Copyright © 2020 Ivan Babushkin. All rights reserved.
//

import Foundation

struct Rating: Decodable {
    let count: Int
    let rows: [Users]
}

struct Users: Decodable {
    let User: User
    let totalScore: Int
}

struct User: Decodable {
    let name: String
}
