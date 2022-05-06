//
//  ZephyrBidOneExerciseApp.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI

@main
struct ZephyrBidOneExerciseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OrdersView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(AppData()) 
        }
    }
}
