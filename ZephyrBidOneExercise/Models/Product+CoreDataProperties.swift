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
    @NSManaged public var brand: String?
    @NSManaged public var price: NSDecimalNumber?
    @NSManaged public var productDescription: String?
    @NSManaged public var orderProducts_: NSSet?

}

// MARK: Generated accessors for orderProducts_
extension Product {

    @objc(addOrderProducts_Object:)
    @NSManaged public func addToOrderProducts_(_ value: OrderProduct)

    @objc(removeOrderProducts_Object:)
    @NSManaged public func removeFromOrderProducts_(_ value: OrderProduct)

    @objc(addOrderProducts_:)
    @NSManaged public func addToOrderProducts_(_ values: NSSet)

    @objc(removeOrderProducts_:)
    @NSManaged public func removeFromOrderProducts_(_ values: NSSet)

}
