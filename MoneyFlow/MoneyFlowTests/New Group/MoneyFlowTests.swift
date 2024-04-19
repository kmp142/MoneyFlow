//
//  MoneyFlowTests.swift
//  MoneyFlowTests
//
//  Created by Dmitry on 24.03.2024.
//

import XCTest
import Combine
@testable import MoneyFlow

final class MoneyFlowTests: XCTestCase {
    
    var viewController: MyViewController!
    var viewModel: MainViewModel!
    override func setUp() {
        super.setUp()
        viewController = MyViewController()
        viewController.viewDidLoad()
        viewModel = MainViewModel()
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func testActivityIndicatorStarts() {
        viewController.viewModel.isLoading = true
        XCTAssertEqual(viewController.activityIndicator.isAnimating, true)
    }
    
    func testMapCellData() {
       let user = Users(name: "TestUser", username: "testuser123", email: "test@example.com", address: Address(street: "123 Test St", suite: "", city: "Test City"), phone: "123-456-7890")
       viewModel.dataSource = [user]
       
       viewModel.mapCellData()
       
       XCTAssertEqual(viewModel.cellDataSource.count, 1)
       XCTAssertNotEqual(viewModel.cellDataSource[0].nameLabel, "TestUser")
       XCTAssertNotEqual(viewModel.cellDataSource[0].moneyLabel, "test@example.com")

   }
}
