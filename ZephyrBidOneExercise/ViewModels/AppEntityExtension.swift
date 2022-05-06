//
//  AppEntityExtension.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI

extension AppEntity {
    /// Parent class of all other CoreData classes.    

    public override func awakeFromInsert() {
        /// UUID is crucial for CoreData objects when sorting and displaying in views.
        /// Otherswise the list behavier is unpredictalbe. ( Such as repeated identical rows. Clicks one row but goes to another instance details view ... )
        setPrimitiveValue(UUID().uuidString, forKey: "id")
    }
}
