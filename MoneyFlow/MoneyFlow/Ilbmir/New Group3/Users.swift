//
//  Users.swift
//  MoneyFlow
//
//  Created by Ильмир Шарафутдинов on 08.04.2024.
//

import Foundation
struct Users: Codable {
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
}
struct Address: Codable {
    let street: String
    let suite: String
    let city: String
}
