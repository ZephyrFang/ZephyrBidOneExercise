//
//  OrderProductExtension.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI

import SwiftUI
import CoreData

extension OrderProduct {
    /// One product in an Order
    /// changes the many to many relationship between Order and Product to one to many relationship
    /// One order can have many orderProducts ( type: [OrderProduct] )
    /// One product can have many productsOrders ( type: [OrderProduct] ) /* Might can be used for finding out which product is the most popular one */
    
    convenience init(order: Order, product: Product, productQuantity: Double, context: NSManagedObjectContext) {
        self.init(context: context)
        
        self.order = order
        self.product = product
        
        /// Moved this property from Product
        self.productQuantity = productQuantity
    }
    
    public var quantityStr: String {
        /// quantity string used in Views   
        BidOneFormatter.quantityFormatter.string(from: self.productQuantity as NSNumber)!
    }
    
    var subTotal: Decimal {
        /// Money paid for this kind of product
        (self.product.price as Decimal) * Decimal(self.productQuantity)
    }
    
    public var subTotalStr: String {
        /// subTotal string used in Views 
        BidOneFormatter.priceFormatter.string(from: self.subTotal as NSNumber)!
    }
   
}
