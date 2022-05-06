//
//  ZephyrBidOneExerciseUITests.swift
//  ZephyrBidOneExerciseUITests
//
//  Created by Zephyr Fang on 7/05/22.
//

import XCTest

class ZephyrBidOneExerciseUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        self.app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_OrdersView() throws {
        XCTAssertTrue(app.staticTexts["Orders"].exists)
        let orderList = app.tables["ordersList"]
        XCTAssertTrue(orderList.exists)
    }
    
    func test_OrdersDetailsView() throws {
        let element = app.staticTexts["Friday Order"]
        XCTAssertTrue(element.exists)
        element.tap()
        
        XCTAssertTrue(app.staticTexts["Order # 4,937"].exists)
        
        XCTAssertTrue(app.staticTexts["Description"].exists)
        XCTAssertTrue(app.staticTexts["Friday Order"].exists)
        
        XCTAssertTrue(app.staticTexts["Total"].exists)
        XCTAssertTrue(app.staticTexts["$39.22"].exists)
        
        XCTAssertTrue(app.staticTexts["GST"].exists)
        XCTAssertTrue(app.staticTexts["$5.88"].exists)
        
        
        XCTAssertTrue(app.staticTexts["Order Date"].exists)
        XCTAssertTrue(app.staticTexts["2020-09-25"].exists)
        
        XCTAssertTrue(app.staticTexts["Delivery Date"].exists)
        XCTAssertTrue(app.staticTexts["2020-09-26"].exists)
        
        XCTAssertTrue(app.staticTexts["2"].exists)
        XCTAssertTrue(app.staticTexts["Products"].exists)
        
        XCTAssertTrue(app.staticTexts["Code"].exists)
        XCTAssertTrue(app.staticTexts["58220"].exists)
        
        XCTAssertTrue(app.staticTexts["Brand"].exists)
        
        XCTAssertTrue(app.staticTexts["Price"].exists)
        XCTAssertTrue(app.staticTexts["$8.28"].exists)
        
        XCTAssertTrue(app.staticTexts["Quantity"].exists)
        XCTAssertTrue(app.staticTexts["1"].exists)
        
        XCTAssertTrue(app.staticTexts["Subtotal"].exists)
        XCTAssertTrue(app.staticTexts["$8.28"].exists)
        
        XCTAssertTrue(app.staticTexts["136341"].exists)
        XCTAssertTrue(app.staticTexts["Caterer's Choice"].exists)
        XCTAssertTrue(app.staticTexts["Chicken Balls Garlic"].exists)
        XCTAssertTrue(app.staticTexts["$15.47"].exists)
        XCTAssertTrue(app.staticTexts["2"].exists)
        XCTAssertTrue(app.staticTexts["$30.94"].exists)        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
