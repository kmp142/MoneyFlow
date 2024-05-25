//
//  SnapshotTests.swift
//  MoneyFlowTests
//
//  Created by Dmitry on 07.04.2024.
//

import XCTest
import SnapshotTesting
@testable import MoneyFlow

final class AddOperationViewSnapshotTests: XCTestCase {

    func testExample() throws {
        let addOperationVM = AddOperationViewModel(storage: WalletOperationsStorage.shared, category: CategoriesManager.defaultCategory)
        let addOperationVC = AddOperationVC(viewModel: addOperationVM)

        assertSnapshot(of: addOperationVC, as: .image)
    }

    func test_add_operation_screen_on_iPad() {
        let addOperationVM = AddOperationViewModel(storage: WalletOperationsStorage.shared, category: CategoriesManager.defaultCategory)
        let addOperationVC = AddOperationVC(viewModel: addOperationVM)

        assertSnapshot(of: addOperationVC, as: .image(on: .iPadMini))
    }
}
