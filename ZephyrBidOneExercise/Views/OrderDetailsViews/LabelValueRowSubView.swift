//
//  LabelValueRowSubView.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI

struct LabelValueRowSubView: View {
    /// Subview of OrderDetailsView.
    /// Displays one property ( label and value ) of the order in OrderDetailsView.
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(self.label)
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(maxWidth: 100, alignment: .leading)
                .padding(.trailing,10)
            
            Text(self.value)                
                .frame(maxWidth: 300, alignment: .leading)
                .labelValueStyler(label: self.label)
        }.padding(.bottom, 5)
    }
}
