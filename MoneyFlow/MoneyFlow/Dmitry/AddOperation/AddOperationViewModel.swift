//
//  AddOperationViewModel.swift
//  MoneyFlow
//
//  Created by Dmitry on 24.03.2024.
//

import Foundation

protocol AddOperationViewModelInterface {
    func saveOperation(with type: OperationType, quantity: Double)
}

class AddOperationViewModel: AddOperationViewModelInterface {

    let storage: OperationsStorageInterface?

    init(storage: OperationsStorageInterface?) {
        self.storage = storage
    }

    func saveOperation(with type: OperationType, quantity: Double) {
        let operation = WalletOperation(type: type, quantity: quantity)
        storage?.saveOperations(operations: [operation])
    }
}
