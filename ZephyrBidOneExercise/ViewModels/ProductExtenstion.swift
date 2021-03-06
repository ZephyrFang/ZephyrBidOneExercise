//
//  ProductExtenstion.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI
import CoreData

extension Product {
    /// The Product class
    /// Removed quantity property to make Product instance reusable  ( moved to OrderProduct )
    
    convenience init(productCode: Int, productDescription: String, brand: String, price: Decimal, context: NSManagedObjectContext) {
        self.init(context: context)
        
        self.productCode = Int64(productCode)
        self.productDescription = productDescription
        self.brand = brand
        self.price = price as NSDecimalNumber
    }
    
    var priceStr: String {
        /// price string used in Views        
        BidOneFormatter.priceFormatter.string(from: self.price)!
    }
}
