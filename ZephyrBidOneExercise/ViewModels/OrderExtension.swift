//
//  OrderExtension.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI
import CoreData

extension Order {
    /// The centre class in this exercise app
    
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
        
        /// Delivery Date can be nil in real life if the goods in the order haven't dilivered.
        self.deliveryDateStr = deliveryDateStr ?? ""
        if deliveryDateStr != nil, let deliveryD = BidOneFormatter.fromStrToDateFormatter.date(from: deliveryDateStr!) {
            self.deliveryDate = deliveryD
        }
    }
    
    private var total: Decimal {
        /// The total amount of money paid for this order
        /// It is the sum of money paid for each kind of product
        var amount: Decimal = 0
        for orderProduct in self.orderProducts {
            amount = amount + orderProduct.subTotal
        }
        return amount
    }
    
    public var totalStr: String {
        /// total string used in Views
        BidOneFormatter.priceFormatter.string(from: self.total as NSNumber)!
    }
    
    public var gstStr: String {
        /// gst string used in Views
        let gst = self.total * 0.15
        return BidOneFormatter.priceFormatter.string(from: gst as NSNumber)!
    }
    
    public var orderProducts: [OrderProduct] {
        /// All the products information ( product and product quantity ) in this order
        let set = self.orderProducts_ as? Set<OrderProduct> ?? []
        return set.sorted {
            ($0.product.productCode, $0.id) < ($1.product.productCode, $1.id)
        }
    }
}

extension Order {
    /// static functions
    
    static func fetch() -> NSFetchRequest<Order> {
        /// Fetches orders sorted by date ( orderDate )
        let request = NSFetchRequest<Order>(entityName: "Order")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Order.orderDate, ascending: false), NSSortDescriptor(keyPath: \Order.id, ascending: true)]
        return request
    }
}
