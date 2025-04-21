//
//  ChartRepository.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/21/25.
//

import Foundation

protocol ChartRepository: AnyObject {
    func getChartCoinInfo(_ id: String) async -> ChartCoinEntity?
}

final class DefaultChartRepository: ChartRepository {
    func getChartCoinInfo(_ id: String) async -> ChartCoinEntity? {
        
        let network = NetworkManager.shared
        let appStorage = AppStorageManager.shared
        let savedList = appStorage.loadFavoriteItem()
        
        do {
            let api = NetworkURL.market(ids: [id])
            let markets: [GeckoMarket] = try await network.request(api: api)

            guard let market = markets.first else { return nil }
            
            let coinEntity: ChartCoinEntity = ChartCoinEntity(
                id: market.id,
                name: market.name,
                image: market.image,
                currentPrice: market.currentPrice.translate₩Formatted(),
                changePercentage: market.pricePercentage.translateChangeRate(),
                high24h: market.highPriceAllDay.translate₩Formatted(),
                low24h: market.lowPriceAllDay.translate₩Formatted(),
                allTimeHighPrice: market.allTimeHighPrice.translate₩Formatted(),
                allTimeLowPrice: market.allTimeLowPrice.translate₩Formatted(),
                sparkLine: market.weeklyPrice.price,
                lastUpdate: market.updateDate.toFormattedDate(),
                isFavorite: savedList.contains(market.id)
            )
            
            
            return coinEntity
        } catch {
            print(error)
            
            return nil
        }
    }
}
