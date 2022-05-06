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
    
    convenience init(order: Order, product: Product, productQuantity: Double, context: NSManagedObjectContext) {
        self.init(context: context)
        
        self.order = order
        self.product = product
        self.productQuantity = productQuantity
    }
    
    var quantityStr: String {
        BidOneFormatter.quantityFormatter.string(from: self.productQuantity as NSNumber)!
    }
    
    var subTotal: Decimal {
        (self.product.price as Decimal) * Decimal(self.productQuantity)
    }
    
    var subTotalStr: String {
        BidOneFormatter.priceFormatter.string(from: self.subTotal as NSNumber)!
    }
   
}
