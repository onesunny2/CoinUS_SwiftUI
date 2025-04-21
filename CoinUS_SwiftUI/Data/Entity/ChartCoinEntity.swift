//
//  ChartCoinEntity.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/21/25.
//

import SwiftUI

struct ChartCoinEntity {
    let id: String
    let name: String
    let image: String
    let currentPrice: String
    let changePercentage: String
    let high24h: String
    let low24h: String
    let allTimeHighPrice: String
    let allTimeLowPrice: String
    let sparkLine: [Double]
    let lastUpdate: String
    let isFavorite: Bool
    
    var percentageStatus: PercentageStatus {
        if changePercentage.contains("-") {
            return .음수
        } else if changePercentage.contains("+") {
            return .양수
        }
        else {
            return .제로
        }
    }
    
    var statusColor: Color {
        switch percentageStatus {
        case .음수: return .blue
        case .제로: return .primary
        case .양수: return .red
        }
    }
}
