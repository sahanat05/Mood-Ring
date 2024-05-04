//
//  User.swift
//  Mood Ring
//
//  Created by Sahana Thayagabalu on 4/23/24.
//

import Foundation

// User struct for database

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
