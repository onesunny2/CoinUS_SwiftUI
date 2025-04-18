//
//  HomeTOPEntity.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/18/25.
//

import Foundation

struct HomeTOPCoinEntity: Hashable, Identifiable {
    let id: String
    let name: String
    let symbol: String
    let image: String
    let price: String
    let changePercentage: String
}
