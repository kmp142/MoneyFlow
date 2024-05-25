//
//  AddOperationViewModel.swift
//  MoneyFlow
//
//  Created by Dmitry on 24.03.2024.
//

import Foundation

protocol AddOperationViewModelInterface {
    func saveOperation(with type: OperationType, quantity: Double)
    func setCurrentCategory(_ category: Category)
}

class AddOperationViewModel: AddOperationViewModelInterface {

    private let storage: OperationsStorageInterface?
    @Published var category: Category

    init(storage: OperationsStorageInterface, category: Category) {
        self.storage = storage
        self.category = category
    }

    func saveOperation(with type: OperationType, quantity: Double) {
        let operation = WalletOperation(type: type, quantity: quantity)
        storage?.saveOperations(operations: [operation])
    }

    func setCurrentCategory(_ category: Category) {
        self.category = category
    }
}
