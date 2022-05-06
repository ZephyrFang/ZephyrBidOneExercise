//
//  OrderRowSubView.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI

struct OrderRowSubView: View {
    /// Subview of OrdersView.
    /// Displays one row of a order.
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var appData: AppData
    @ObservedObject var order: Order
    
    var body: some View {
        
        HStack {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 70, height: 100)
                VStack {
                    Text("#")
                    Text("\(self.order.orderId )")
                }.font(.body.bold()).foregroundColor(self.appData.appColour)
            }
            VStack(alignment: .leading) {
                Text("\(self.order.orderDescription)")
                    .font(.body)
                    .padding(.bottom, 5)
                if self.order.orderProducts.count > 1 {
                    Text("\(self.order.orderProducts.count) Products")
                        .fontWeight(.light)
                }
                else {
                    Text("\(self.order.orderProducts.count) Product")
                        .fontWeight(.light)
                }
                Text("Order Date: \(self.order.orderDateStr)")
                    .fontWeight(.light)
                Text("Delivery Date: \(self.order.deliveryDateStr)")
                    .fontWeight(.light)
            }.font(.footnote)
            
            Text(self.order.totalStr)
                .font(.body)
        }
        
    }
}

/*struct OrderRowSubView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowSubView(order: PreviewData.getOrder())
            .preferredColorScheme(.dark)
        
        ForEach(PreviewData.devices, id: \.self) { deviceName in
            OrderRowSubView(order: PreviewData.getOrder())
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
            
        }
    }
}*/
