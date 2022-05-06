//
//  AppEntity+CoreDataProperties.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//
//

import Foundation
import CoreData


extension AppEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppEntity> {
        return NSFetchRequest<AppEntity>(entityName: "AppEntity")
    }

    @NSManaged public var id: String

}

extension AppEntity : Identifiable {

}
