//
//  Product+CoreDataProperties.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var productCode: Int64
    @NSManaged public var brand: String
    @NSManaged public var price: NSDecimalNumber
    @NSManaged public var productDescription: String
    @NSManaged public var productOrders_: NSSet?

}

// MARK: Generated accessors for productOrders_
extension Product {

    @objc(addProductOrders_Object:)
    @NSManaged public func addToProductOrders_(_ value: OrderProduct)

    @objc(removeProductOrders_Object:)
    @NSManaged public func removeFromProductOrders_(_ value: OrderProduct)

    @objc(addProductOrders_:)
    @NSManaged public func addToProductOrders_(_ values: NSSet)

    @objc(removeProductOrders_:)
    @NSManaged public func removeFromProductOrders_(_ values: NSSet)

}
