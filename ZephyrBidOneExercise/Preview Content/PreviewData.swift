//
//  PreviewData.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI

struct PreviewData {
    /// Data used by the previews
    
    static var devices = ["iPhone 8", "iPhone 12 mini", "iPhone 13 Pro Max",  "iPad Pro (12.9-inch) (5th generation)"]
    
    static var context = PersistenceController.preview.container.viewContext
    
    static func getOrder() -> Order {
        let PRODUCT_1 = Product(
            productCode: 136341,
            productDescription: "Chicken Balls Garlic",
            brand: "Caterer's Choice",
            price: 15.47,
            context: context
        )
      
        let PRODUCT_3 = Product(
            productCode: 58220,
            productDescription: "Tomato Puree",
            brand: "",
            price: 8.28,
            context: context
        )
        
        let order_1 = Order(
            orderId: 4937,
            orderDescription: "Friday Order",
            orderDateStr: "2020-09-25",
            deliveryDateStr: "2020-09-26",
            context: context
        )
        /// order_1 products
        _ = OrderProduct(
                order: order_1,
                product: PRODUCT_1,
                productQuantity: 2.0,
                context: context
            )
        _ = OrderProduct(
                order: order_1,
                product: PRODUCT_3,
                productQuantity: 1.0,
                context: context
            )
        return order_1
    }
    
    /*static let PRODUCT_1 = Product(
        productCode: 136341,
        productDescription: "Chicken Balls Garlic",
        brand: "Caterer's Choice",
        price: 15.47,
        context: context
    )
  
    static let PRODUCT_3 = Product(
        productCode: 58220,
        productDescription: "Tomato Puree",
        brand: "",
        price: 8.28,
        context: context
    )
    
    static let order_1 = Order(
        orderId: 4937,
        orderDescription: "Friday Order",
        orderDateStr: "2020-09-25",
        deliveryDateStr: "2020-09-26",
        context: context
    )
    /// order_1 products
    static let order1_product_1 = OrderProduct(
            order: order_1,
            product: PRODUCT_1,
            productQuantity: 2.0,
            context: context
        )
    static let order1_product_3 = OrderProduct(
            order: order_1,
            product: PRODUCT_3,
            productQuantity: 1.0,
            context: context
        )
    
*/
}

