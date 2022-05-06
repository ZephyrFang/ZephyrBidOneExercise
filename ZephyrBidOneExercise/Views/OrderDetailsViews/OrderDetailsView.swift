//
//  OrderDetailsView.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI

struct OrderDetailsView: View {
    /// Displays a detailed order view when user selects an order in OrdersView
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var appData: AppData
    
    @ObservedObject var order: Order
    
    var product_count: Int {
        self.order.orderProducts.count
    }
    
    var body: some View {
        
        Form {
            Section {                
                LabelValueRowSubView(label: "Description", value: self.order.orderDescription)
                LabelValueRowSubView(label: "Total", value: self.order.totalStr)
                LabelValueRowSubView(label: "GST", value: self.order.gstStr)
                LabelValueRowSubView(label: "Order Date", value: self.order.orderDateStr)
                LabelValueRowSubView(label: "Delivery Date", value: self.order.deliveryDateStr)
            }
            
            Section(header: HStack {
                Text("\(self.product_count)")
                    .foregroundColor(appData.appColour)
                if self.product_count > 1 {
                    Text("Products")
                }
                else {
                    Text("Product")
                }
            }){
                List {
                    ForEach( self.order.orderProducts ) { orderProduct in
                        OrderProductSubView(orderProduct: orderProduct, product: orderProduct.product)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Order # \(self.order.orderId)")
                    .font(.headline)
            }
        }
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    /// To make the preview work, you have to stopped using the simulator and chose "Any iOS Device"
    static var previews: some View {
        OrderDetailsView(order: PreviewData.getOrder())
            .preferredColorScheme(.dark)
            .environmentObject(AppData()) 
        ForEach(PreviewData.devices, id: \.self) { deviceName in
            OrderDetailsView(order: PreviewData.getOrder())
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
            .environmentObject(AppData()) 
        }
    }
}
