//
//  HomeTOPCoinEntity.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/18/25.
//

import Foundation

struct TrendTOPCoinEntity: Identifiable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let image: String
    let price: String
    let changePercentage: String
    
    var percentageStatus: PercentageStatus {
        if changePercentage.contains("-") {
            return .음수
        } else if changePercentage.contains("+") {
            return .양수
        } else {
            return .제로
        }
    }
}
