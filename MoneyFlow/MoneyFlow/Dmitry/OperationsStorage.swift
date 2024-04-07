//
//  OperationsStorage.swift
//  MoneyFlow
//
//  Created by Dmitry on 07.04.2024.
//

import Foundation

protocol OperationsStorageInterface {
    func saveOperations(operations: [WalletOperation])
    func removeOperations(operations: [WalletOperation])
}

class WalletOperationsStorage: OperationsStorageInterface {

    static let shared = WalletOperationsStorage()

    var operations = [WalletOperation]()

    private init(){}

    func saveOperations(operations: [WalletOperation]) {
        self.operations += operations
        self.operations.forEach { print($0.quantity) }
    }

    func removeOperations(operations: [WalletOperation]) {
        self.operations.removeAll { operations.contains($0)}
    }

    func removeAllOperations() {
        operations.removeAll()
    }
}
