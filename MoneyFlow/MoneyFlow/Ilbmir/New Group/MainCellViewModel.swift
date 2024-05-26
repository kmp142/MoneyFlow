//
//  MainCellViewModel.swift
//  MoneyFlow
//
//  Created by Ильмир Шарафутдинов on 04.04.2024.
//

import Foundation

class MainCellViewModel {
    
    let nameLabel: String
    let moneyLabel: String
    
    init(_ users: Users) {
        self.nameLabel = users.name
        self.moneyLabel = users.email
    }
}
