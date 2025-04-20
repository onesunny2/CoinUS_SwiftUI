//
//  SearchRepository.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/20/25.
//

import Foundation

protocol SearchRepository: AnyObject {
    func getSearchInfo(_ keyword: String) -> [SearchCoinEntity]
}

final class DummySearchRepository: SearchRepository {
    func getSearchInfo(_ keyword: String) -> [SearchCoinEntity] {
        
        let appStorage = AppStorageManager.shared
        
        // TODO: 실제 네트워크 통신 시에는 id 받아서 확인해야 함
        
        return [
            SearchCoinEntity(
                id: "bitcoin",
                name: "Bitcoin",
                symbol: "BTC",
                image: "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bitget-token",
                name: "Bitget Token",
                symbol: "BGB",
                image: "https://assets.coingecko.com/coins/images/11610/thumb/bitget-token.png?1599521200",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bitgert",
                name: "Bitgert",
                symbol: "BRISE",
                image: "https://assets.coingecko.com/coins/images/17388/thumb/bitrise-token.png?1626960577",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bitcoin-cash",
                name: "Bitcoin Cash",
                symbol: "BCH",
                image: "https://assets.coingecko.com/coins/images/780/thumb/bitcoin-cash.png?1594689492",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bitcoin-sv",
                name: "Bitcoin SV",
                symbol: "BSV",
                image: "https://assets.coingecko.com/coins/images/6799/thumb/bitcoin-sv.png?1558962194",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bittorrent",
                name: "BitTorrent",
                symbol: "BTT",
                image: "https://assets.coingecko.com/coins/images/7595/thumb/bittorrent.png?1559013960",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bitdao",
                name: "BitDAO",
                symbol: "BIT",
                image: "https://assets.coingecko.com/coins/images/17777/thumb/bitdao.png?1629880160",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bitshares",
                name: "BitShares",
                symbol: "BTS",
                image: "https://assets.coingecko.com/coins/images/95/thumb/bitshares.png?1547033603",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bitcoiva",
                name: "Bitcoiva",
                symbol: "BCA",
                image: "https://assets.coingecko.com/coins/images/15034/thumb/bitcoiva.png?1619682400",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bitcicoin",
                name: "Bitcicoin",
                symbol: "BITCI",
                image: "https://assets.coingecko.com/coins/images/11290/thumb/bitcicoin.png?1595701180",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bitkub-coin",
                name: "Bitkub Coin",
                symbol: "KUB",
                image: "https://assets.coingecko.com/coins/images/15762/thumb/bitkub-coin.png?1621848700",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bitrue-coin",
                name: "Bitrue Coin",
                symbol: "BTR",
                image: "https://assets.coingecko.com/coins/images/16530/thumb/bitrue-coin.png?1624872900",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bitswap",
                name: "BitSwap",
                symbol: "BSWAP",
                image: "https://assets.coingecko.com/coins/images/18034/thumb/bitswap.png?1630314200",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bitmart-token",
                name: "BitMart Token",
                symbol: "BMX",
                image: "https://assets.coingecko.com/coins/images/8466/thumb/bitmart-token.png?1558432510",
                isFavorite: false
            ),
            SearchCoinEntity(
                id: "bitzen",
                name: "Bitzen",
                symbol: "BZEN",
                image: "https://assets.coingecko.com/coins/images/19045/thumb/bitzen.png?1633945200",
                isFavorite: false
            )
        ]
    }
}
