//
//  OrderProduct+CoreDataProperties.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//
//

import Foundation
import CoreData


extension OrderProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrderProduct> {
        return NSFetchRequest<OrderProduct>(entityName: "OrderProduct")
    }

    @NSManaged public var productQuantity: Double
    @NSManaged public var order: Order?
    @NSManaged public var product: Product?

}
