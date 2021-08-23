//
//  Date+Extension.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/23.
//

import Foundation

extension Date {
    
    var MMYYFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
    
    var MMYYDDFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}
