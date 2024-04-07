//
//  Operation.swift
//  MoneyFlow
//
//  Created by Dmitry on 07.04.2024.
//

import Foundation

class WalletOperation: NSObject {
    let type: OperationType
    let quantity: Double

    init(type: OperationType, quantity: Double) {
        self.type = type
        self.quantity = quantity
    }
}
