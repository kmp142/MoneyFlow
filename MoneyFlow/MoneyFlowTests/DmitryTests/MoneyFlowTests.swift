//
//  MoneyFlowTests.swift
//  MoneyFlowTests
//
//  Created by Dmitry on 24.03.2024.
//

import XCTest
@testable import MoneyFlow

final class MoneyFlowTests: XCTestCase {

    func areEqual<T: Equatable>(_ value1: T, _ value2: T) -> Bool {
        return value1 == value2
    }

    let storage = WalletOperationsStorage.shared
    lazy var addOperationViewModel = AddOperationViewModel(storage: storage, category: CategoriesManager.defaultCategory)

    func test_generic_function() {
        XCTAssertEqual(true, areEqual<Int>(1, 1))
        XCTAssertEqual(false, areEqual<Int>(1, 2))
        XCTAssertEqual(true, areEqual<Int>("abc", "abc"))
        XCTAssertEqual(false, areEqual<Int>("abc", "bgr"))
    }

    func test_operation_saving() {
        addOperationViewModel.saveOperation(with: .expense, quantity: 100)
        XCTAssertEqual(storage.operations.last?.quantity, 100)
        XCTAssertEqual(storage.operations.last?.type, .expense)
    }

    func test_operation_removing() {
        let operations = [WalletOperation(type: .expense, quantity: 100)]
        storage.removeAllOperations()
        storage.saveOperations(operations: operations)
        storage.removeOperations(operations: operations)
        XCTAssertTrue(storage.operations.isEmpty)
    }

    func test_multiply_removing() {
        let operations = [
            WalletOperation(type: .expense, quantity: 100),
            WalletOperation(type: .income, quantity: 20),
            WalletOperation(type: .expense, quantity: 110),
            WalletOperation(type: .expense, quantity: 120),
            WalletOperation(type: .income, quantity: 190),
            WalletOperation(type: .expense, quantity: 250),
        ]

        let leftPartOfOperations = [operations[0], operations[1], operations[2]]
        let rightPartOfOperations = [operations[3], operations[4], operations[5]]

        storage.saveOperations(operations: operations)
        storage.removeOperations(operations: leftPartOfOperations)
        XCTAssertEqual(storage.operations, rightPartOfOperations)
    }
}
