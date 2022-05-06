//
//  AppData.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI
import CoreData

final class AppData: ObservableObject {
    /// The enviroment object used by the app
    
    @Published var appColour = Color.green
    
    static func fillInOrders(context: NSManagedObjectContext) {
        /// Pre fills in products and orders
        
        /// Fills in products
        let PRODUCT_1 = Product(
            productCode: 136341,
            productDescription: "Chicken Balls Garlic",
            brand: "Caterer's Choice",
            price: 15.47,
            context: context
        )
        let PRODUCT_2 = Product(
            productCode: 172488,
            productDescription: "Beef Rump G/Fed",
            brand: "Meat",
            price: 17.87,
            context: context
        )
        let PRODUCT_3 = Product(
            productCode: 58220,
            productDescription: "Tomato Puree",
            brand: "",
            price: 8.28,
            context: context
        )
        let PRODUCT_4 = Product(
            productCode: 183968,
            productDescription: "Chips 10mm French Fries Straight Cut",
            brand: "Jeffersons",
            price: 26.10,
            context: context
        )
        let PRODUCT_5 = Product(
            productCode: 64996,
            productDescription: "Chocolate Buttons Milk",
            brand: "Caterers Choice",
            price: 10.14,
            context: context
        )
        /// order_1
        let order_1 = Order(
            orderId: 4937,
            orderDescription: "Friday Order",
            orderDateStr: "2020-09-25",
            deliveryDateStr: "2020-09-26",
            context: context
        )
        /// order_1 products
        let _ = OrderProduct(
                order: order_1,
                product: PRODUCT_1,
                productQuantity: 2.0,
                context: context
            )
        let _ = OrderProduct(
                order: order_1,
                product: PRODUCT_3,
                productQuantity: 1.0,
                context: context
            )
        
        /// order_2
        let order_2 = Order(
            orderId: 1804,
            orderDescription: "Meats",
            orderDateStr: "2020-08-11",
            deliveryDateStr: "2020-08-12",
            context: context
        )
        /// order_2 products
        let _ = OrderProduct(
                order: order_2,
                product: PRODUCT_1,
                productQuantity: 2.0,
                context: context
            )
        let _ =  OrderProduct(
                order: order_2,
                product: PRODUCT_3,
                productQuantity: 1.0,
                context: context
            )
        
        /// order_3
        let order_3 = Order(
            orderId: 9639,
            orderDescription: "Chocolate",
            orderDateStr: "2020-11-02",
            deliveryDateStr: "2020-11-03",
            context: context
        )
        /// order_3 products
        let _ = OrderProduct(
                order: order_3,
                product: PRODUCT_5,
                productQuantity: 5.0,
                context: context
            )
        
        /// order_4
        let order_4 = Order(
            orderId: 2709,
            orderDescription: "Big Order",
            orderDateStr: "2020-06-09",
            deliveryDateStr: "2020-06-10",
            context: context
        )
        /// order_4 products
        let _ = OrderProduct(
                order: order_4,
                product: PRODUCT_1,
                productQuantity: 2.0,
                context: context
            )
        let _ = OrderProduct(
                order: order_4,
                product: PRODUCT_2,
                productQuantity: 3.2,
                context: context
            )
        let _ = OrderProduct(
                order: order_4,
                product: PRODUCT_3,
                productQuantity: 1.0,
                context: context
            )
        let _ = OrderProduct(
                order: order_4,
                product: PRODUCT_4,
                productQuantity: 1.0,
                context: context
            )
        let _ = OrderProduct(
                order: order_4,
                product: PRODUCT_5,
                productQuantity: 5.0,
                context: context
            )
    }
    
    static func saveContext(objectContext: NSManagedObjectContext) {
        /// Saves changes to Context
        do {
            try objectContext.save()
        } catch {
            print("Error saving managed ojbect context: \(error)")
            
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            
            /*// Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            objectContext.rollback()
            userMessage = "\(error): \(error.localizedDescription)"
            displayMessage.toggle()
            */
        }
        
        
    }
}
