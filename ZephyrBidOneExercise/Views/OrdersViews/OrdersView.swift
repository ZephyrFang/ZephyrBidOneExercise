//
//  ContentView.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI
import CoreData

struct OrdersView: View {
    /// The entrance view. Displays orders in a sorted list ( sorted by OrderDate )
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var appData: AppData
    
    @FetchRequest(fetchRequest: Order.fetch(), animation: .default )
    private var orders: FetchedResults<Order>

    var body: some View {
        NavigationView {
            List {
                ForEach(self.orders) { order in
                    NavigationLink {
                        OrderDetailsView(order: order)
                    } label: {
                        OrderRowSubView(order: order)
                    }
                }
            }
            .accessibilityIdentifier("ordersList")
            .onAppear {
                if self.orders.count == 0 {
                    AppData.fillInOrders(context: self.viewContext)
                    AppData.saveContext(objectContext: self.viewContext)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Orders").font(.headline)
                }
            }
        }
    }
}

/*struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}*/
