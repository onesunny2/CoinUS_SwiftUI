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
}
