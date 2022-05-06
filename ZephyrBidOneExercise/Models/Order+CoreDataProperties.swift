//
//  Order+CoreDataProperties.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var orderId: Int64
    @NSManaged public var orderDescription: String?
    @NSManaged public var orderDateStr: String?
    @NSManaged public var orderDate: Date?
    @NSManaged public var deliveryDate: Date?
    @NSManaged public var deliveryDateStr: String?
    @NSManaged public var orderProducts_: NSSet?

}

// MARK: Generated accessors for orderProducts_
extension Order {

    @objc(addOrderProducts_Object:)
    @NSManaged public func addToOrderProducts_(_ value: OrderProduct)

    @objc(removeOrderProducts_Object:)
    @NSManaged public func removeFromOrderProducts_(_ value: OrderProduct)

    @objc(addOrderProducts_:)
    @NSManaged public func addToOrderProducts_(_ values: NSSet)

    @objc(removeOrderProducts_:)
    @NSManaged public func removeFromOrderProducts_(_ values: NSSet)

}
