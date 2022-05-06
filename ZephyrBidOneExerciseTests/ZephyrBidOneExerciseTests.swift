//
//  ZephyrBidOneExerciseTests.swift
//  ZephyrBidOneExerciseTests
//
//  Created by Zephyr Fang on 7/05/22.
//

import XCTest
@testable import ZephyrBidOneExercise

class ZephyrBidOneExerciseTests: XCTestCase {
    
    let context = PersistenceController.empty.container.viewContext
    var PRODUCT_1: Product!
    var PRODUCT_3: Product!
    var PRODUCT_5: Product!
    var order_1: Order!
    var order1_product1: OrderProduct!
    var order1_product3: OrderProduct!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        PRODUCT_1 = Product(
            productCode: 136341,
            productDescription: "Chicken Balls Garlic",
            brand: "Caterer's Choice",
            price: 15.47,
            context: context
        )
      
        PRODUCT_3 = Product(
            productCode: 58220,
            productDescription: "Tomato Puree",
            brand: "",
            price: 8.28,
            context: context
        )
        
        order_1 = Order(
            orderId: 4937,
            orderDescription: "Friday Order",
            orderDateStr: "2020-09-25",
            deliveryDateStr: "2020-09-26",
            context: context
        )
        /// order_1 products
        order1_product1 = OrderProduct(
                order: order_1,
                product: PRODUCT_1,
                productQuantity: 2.0,
                context: context
            )
        order1_product3 = OrderProduct(
                order: order_1,
                product: PRODUCT_3,
                productQuantity: 1.0,
                context: context
            )
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_convertDateStringToDate() throws {
        let orderD = BidOneFormatter.fromStrToDateFormatter.date(from: "2020-09-25")
        XCTAssertNotNil(orderD)
    }

    func test_orderProduct_subTotal() throws {
        XCTAssertEqual( order1_product1.subTotalStr, "$30.94" )
    }
    
    func test_order_total() throws {
        XCTAssertEqual( self.order_1.totalStr, "$39.22" )
    }
    
    func test_order_gstStr() throws {
        XCTAssertEqual( self.order_1.gstStr, "$5.88" )
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

