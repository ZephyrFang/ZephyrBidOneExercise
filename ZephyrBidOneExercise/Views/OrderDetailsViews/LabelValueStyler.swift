//
//  LabelValueStyler.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI

struct LabelValueStyler: ViewModifier {
    /// Chages the style of the LabelValueSubView  according to different properties of the order.    
    @EnvironmentObject var appData: AppData
    var label: String
    
    func body(content: Content) -> some View {
        if self.label == "Code" {
            content
                .foregroundColor(appData.appColour)
        }
        else {
            content
        }
    }
}

extension View {
    func labelValueStyler(label: String) -> some View {
        modifier(LabelValueStyler(label: label))
    }
}
