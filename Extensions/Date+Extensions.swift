//
//  Date+Extensions.swift
//  LifeTarget
//
//  Created by HarrisShao on 2025/6/15.
//

import SwiftUI

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        
        return dateFormatter.string(from: self)
    }
    
}


extension Date {
    func daysUntilDate(_ targetDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self, to: targetDate)
        return components.day ?? 0
    }
}
