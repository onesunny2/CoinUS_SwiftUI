//
//  GeckoTrending.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/18/25.
//

import Foundation

struct GeckoTrending: Decodable {
    let coins: [CoinTrend]
    let nfts: [NftTrend]
}

struct CoinTrend: Decodable {
    let item: CoinItem
}

struct NftTrend: Decodable {
    let id: String
    let name: String
    let thumbImgURL: String
    let data: NftItemData
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case thumbImgURL = "thumb"
        case data
    }
}

struct CoinItem: Decodable {
    let stringID: String
    let intID: Int
    let name: String
    let symbol: String
    let thumbImgURL: String
    let smallImgURL: String
    let largeImgURL: String
    let data: CoinItemData
    
    enum CodingKeys: String, CodingKey {
        case stringID = "id"
        case intID = "coin_id"
        case name
        case symbol
        case thumbImgURL = "thumb"
        case smallImgURL = "small"
        case largeImgURL = "large"
        case data
    }
}

struct CoinItemData: Decodable {
    let price: Double  // 코인 현재가
    let changePercentage: Percentage24h  // 24시간 코인 변동폭
    
    enum CodingKeys: String, CodingKey {
        case price
        case changePercentage = "price_change_percentage_24h"
    }
}

struct Percentage24h: Decodable {
    let krw: Double
}

struct NftItemData: Decodable {
    let floorPrice: String
    let changePercentage: String
    
    enum CodingKeys: String, CodingKey {
        case floorPrice = "floor_price"
        case changePercentage = "floor_price_in_usd_24h_percentage_change"
    }
}
