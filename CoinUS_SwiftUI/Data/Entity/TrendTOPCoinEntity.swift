//
//  HomeTOPCoinEntity.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/18/25.
//

import SwiftUI

struct TrendTOPEntity: Identifiable, Hashable {
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
