//
//  FavoriteCoinEntity.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI

struct FavoriteCoinEntity: Identifiable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let image: String
    let currentPrice: String
    let changePercentage: String // 24시간 변동폭
    
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
    
    var backgroundColor: Color {
        switch percentageStatus {
        case .음수: return .blue.opacity(0.1)
        case .제로: return .primary.opacity(0.1)
        case .양수: return .red.opacity(0.1)
        }
    }
}
