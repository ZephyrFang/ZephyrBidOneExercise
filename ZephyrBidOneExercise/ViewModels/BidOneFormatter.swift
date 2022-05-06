//
//  BidOneFormatter.swift
//  ZephyrBidOneExercise
//
//  Created by Zephyr Fang on 7/05/22.
//

import SwiftUI

struct BidOneFormatter {
    
    static var priceFormatter: NumberFormatter {
        /// To convert price ( Decima l) to String
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.numberStyle = .currency
        return formatter
    }
    
    static var quantityFormatter: NumberFormatter {
        /// To convert quantity ( Float ) to String
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        return formatter
    }
    
    static var fromStrToDateFormatter: DateFormatter {
        /// To convert date String to Date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        return formatter
    }
    
    /*static var fromDateToStrFormatter: DateFormatter {
        /// To convert Date to String.
        let formatter = DateFormatter()
        //formatter.dateFormat = "MMM dd, yyyy"
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }*/
    
}
