//
//  String+.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/21/25.
//

import Foundation

extension String {
    
    func getNftPrice() -> String {
        let array = Array(self.split(separator: " "))
        let number = String(format: "%.2f", Double(array[0]) ?? 0)
        let current = array[1]
        
        return "\(number) \(current)"
    }
    
    func toFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        guard let date = dateFormatter.date(from: self) else {
            return ""
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "M/dd HH:mm:ss 업데이트"
        
        return outputFormatter.string(from: date)
    }
}
