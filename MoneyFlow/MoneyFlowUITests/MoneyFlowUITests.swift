//
//  MoneyFlowUITests.swift
//  MoneyFlowUITests
//
//  Created by Dmitry on 24.03.2024.
//

import XCTest

final class MoneyFlowUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_buttons_count() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        XCTAssertEqual(app.buttons.count, 3)
    }

    func test_quntity_text_field_existance() {
        let app = XCUIApplication()
        app.launch()
        XCTAssertNotNil(app.textFields["quantityTextField"])
    }
}
