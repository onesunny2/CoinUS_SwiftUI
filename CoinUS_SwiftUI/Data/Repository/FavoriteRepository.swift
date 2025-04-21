//
//  FavoriteRepository.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import Foundation

protocol FavoriteRepository: AnyObject {
    func getFavoriteInfo(type: FavoriteType) async -> [FavoriteCoinEntity]
}

final class DefaultFavoriteRepository: FavoriteRepository {
    func getFavoriteInfo(type: FavoriteType) async -> [FavoriteCoinEntity] {
        
        let appStorage = AppStorageManager.shared
        let savedIds = appStorage.loadFavoriteItem()
        
        let network = NetworkManager.shared
        
        guard !savedIds.isEmpty else { return [] }
        
        do {
            let api = NetworkURL.market(ids: savedIds)
            let markets: [GeckoMarket] = try await network.request(api: api)
            
            let favoriteEntities = markets.map {
                
                let price = "₩\($0.currentPrice.formatted())"
                let percentage = $0.pricePercentage.translateChangeRate()
                
                return FavoriteCoinEntity(
                    id: $0.id,
                    name: $0.name,
                    symbol: $0.symbol,
                    image: $0.image,
                    currentPrice: price,
                    changePercentage: percentage
                )
            }
            
            return favoriteEntities
        } catch {
            print(error)
            return []
        }
    }
}

final class DummyFavoriteRepository: FavoriteRepository {
    func getFavoriteInfo(type: FavoriteType) async -> [FavoriteCoinEntity] {
        switch type {
        default:
            return [
                FavoriteCoinEntity(
                    id: "bitcoin",
                    name: "Bitcoin",
                    symbol: "BTC",
                    image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                    currentPrice: "120,970,064",
                    changePercentage: "+0.71%"
                ),
                FavoriteCoinEntity(
                    id: "ethereum",
                    name: "Ethereum",
                    symbol: "ETH",
                    image: "https://coin-images.coingecko.com/coins/images/279/large/ethereum.png?1696501628",
                    currentPrice: "4,567,890",
                    changePercentage: "-1.23%"
                ),
                FavoriteCoinEntity(
                    id: "binancecoin",
                    name: "Binance Coin",
                    symbol: "BNB",
                    image: "https://coin-images.coingecko.com/coins/images/825/large/binance-coin.png?1696501843",
                    currentPrice: "789,123",
                    changePercentage: "+2.45%"
                ),
                FavoriteCoinEntity(
                    id: "solana",
                    name: "Solana",
                    symbol: "SOL",
                    image: "https://coin-images.coingecko.com/coins/images/4128/large/solana.png?1696504756",
                    currentPrice: "234,567",
                    changePercentage: "-0.89%"
                ),
                FavoriteCoinEntity(
                    id: "cardano",
                    name: "Cardano",
                    symbol: "ADA",
                    image: "https://coin-images.coingecko.com/coins/images/975/large/cardano.png?1696502941",
                    currentPrice: "1,234",
                    changePercentage: "+1.67%"
                )
            ]
        }
    }
}
