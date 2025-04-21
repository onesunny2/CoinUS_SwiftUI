//
//  Double+.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/21/25.
//

import Foundation

extension Double {
    
    // MARK: 전일대비 퍼센테이지 소수점 3자리에서 2자리로 반올림
    func translateChangeRate() -> String {
        
        let new = (self * 100).rounded(.toNearestOrAwayFromZero) / 100
        
        if new > 0 {
            return "+" + String(format: "%.2f", new) + "%"
        } else if new == 0 {
            return "0.00%"
        } else {
            return String(format: "%.2f", new) + "%"
        }
    }
}
