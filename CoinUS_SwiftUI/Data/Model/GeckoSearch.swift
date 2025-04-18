//
//  GeckoSearch.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/18/25.
//

import Foundation

struct GeckoSearch: Decodable {
    let coins: [SearchItems]
}

struct SearchItems: Decodable {
    let id: String
    let name: String
    let symbol: String
    let totalMarketRank: Int?
    let thumbImgURL: String
    let largeImgURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case totalMarketRank = "market_cap_rank"
        case thumbImgURL = "thumb"
        case largeImgURL = "large"
    }
}
