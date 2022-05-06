//
//  OrderProductSubView.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI

struct OrderProductSubView: View {
    /// Subview of OrderDetailsView.
    /// Displays one product of the order in OrderDetailsView.
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var orderProduct: OrderProduct
    @ObservedObject var product: Product
    
    var body: some View {
        VStack {
            LabelValueRowSubView(label: "Code", value: "\(self.product.productCode)")
            LabelValueRowSubView(label: "Brand", value: self.product.brand)
            LabelValueRowSubView(label: "Description", value: self.product.productDescription)
            LabelValueRowSubView(label: "Price", value: self.product.priceStr)
            LabelValueRowSubView(label: "Quantity", value: self.orderProduct.quantityStr)
            LabelValueRowSubView(label: "Subtotal", value: self.orderProduct.subTotalStr)
        }.padding()
    }
}

/*struct OrderProductSubView_Previews: PreviewProvider {
    static var previews: some View {
        OrderProductSubView()
    }
}*/
