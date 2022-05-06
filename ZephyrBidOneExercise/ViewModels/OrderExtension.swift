//
//  OrderExtension.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI
import CoreData

extension Order {
    
    convenience init(orderId: Int, orderDescription: String, orderDateStr: String, deliveryDateStr: String?, context: NSManagedObjectContext) {
        self.init(context: context)
        
        self.orderId = Int64(orderId)
        self.orderDescription = orderDescription
        
        /// Converts string type date properties to Date type so the orders can be sorted by Date
        self.orderDateStr = orderDateStr
        if let orderD = BidOneFormatter.fromStrToDateFormatter.date(from: orderDateStr) {
            self.orderDate = orderD
        }
        else {
            self.orderDate = Date()
        }
        
        self.deliveryDateStr = deliveryDateStr ?? ""
        if deliveryDateStr != nil, let deliveryD = BidOneFormatter.fromStrToDateFormatter.date(from: deliveryDateStr!) {
            self.deliveryDate = deliveryD
        }
    }
    
    public func getTotal() -> Decimal {
        var amount: Decimal = 0
        for orderProduct in self.orderProducts {
            amount = amount + orderProduct.subTotal
        }
        return amount
    }
    
    public var totalStr: String {
        BidOneFormatter.priceFormatter.string(from: self.getTotal() as NSNumber)!
    }
    
    public var gstStr: String {
        let gst = self.getTotal() * 0.15
        return BidOneFormatter.priceFormatter.string(from: gst as NSNumber)!
    }
    
    public var orderProducts: [OrderProduct] {
        let set = self.orderProducts_ as? Set<OrderProduct> ?? []
        return set.sorted {
            $0.product.productCode < $1.product.productCode
        }
    }
}

extension Order {
    /// static functions
    
    static func fetch() -> NSFetchRequest<Order> {
        /// Fetches orders sorted by date ( orderDate )
        let request = NSFetchRequest<Order>(entityName: "Order")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Order.orderDate, ascending: false)]
        return request
    }
}
