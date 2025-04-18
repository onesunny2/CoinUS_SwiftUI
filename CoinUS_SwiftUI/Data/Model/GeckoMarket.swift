//
//  GeckoMarket.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/18/25.
//

import Foundation

struct GeckoMarket: Decodable {
    let id: String
    let name: String
    let symbol: String // 코인 통화 단위
    let image: String
    let currentPrice: Double
    let totalMarketPrice: Double  // 시가 총액
    let dilutedValue: Double  // 완전 희석 가치
    let totalVolume: Double
    let highPriceAllDay: Double
    let lowPriceAllDay: Double
    let pricePercentage: Double
    let allTimeHighPrice: Double
    let allTimeHighDate: String
    let allTimeLowPrice: Double
    let allTimeLowDate: String
    let updateDate: String
    let weeklyPrice: WeeklyPrice
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case image
        case currentPrice = "current_price"
        case totalMarketPrice = "market_cap"
        case dilutedValue = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case highPriceAllDay = "high_24h"
        case lowPriceAllDay = "low_24h"
        case pricePercentage = "price_change_percentage_24h"
        case allTimeHighPrice = "ath"
        case allTimeHighDate = "ath_date"
        case allTimeLowPrice = "atl"
        case allTimeLowDate = "atl_date"
        case updateDate = "last_updated"
        case weeklyPrice = "sparkline_in_7d"
    }
}

struct WeeklyPrice: Decodable {
    let price: [Double]
}
