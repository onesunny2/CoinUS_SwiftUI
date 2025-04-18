//
//  HomeRepository.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/18/25.
//

import Foundation

protocol TrendRepository: AnyObject {
    func getTrendCoin() -> [TrendTOPCoinEntity]
    func getTrendNft() -> [TrendTOPNftEntity]
}

final class DummyTrendRepository: TrendRepository {
    
    func getTrendCoin() -> [TrendTOPCoinEntity] {
        return [
            TrendTOPCoinEntity(
                id: "mantra-dao",
                name: "MANTRA",
                symbol: "OM",
                image: "https://coin-images.coingecko.com/coins/images/12151/standard/OM_Token.png",
                price: "636 KRW",
                changePercentage: "-8.02%"
            ),
            TrendTOPCoinEntity(
                id: "connect-token-wct",
                name: "WalletConnect Token",
                symbol: "WCT",
                image: "https://coin-images.coingecko.com/coins/images/50390/standard/wc-token1.png",
                price: "350 KRW",
                changePercentage: "-12.76%"
            ),
            TrendTOPCoinEntity(
                id: "fartcoin",
                name: "Fartcoin",
                symbol: "FARTCOIN",
                image: "https://coin-images.coingecko.com/coins/images/50891/standard/fart.jpg",
                price: "757 KRW",
                changePercentage: "-17.52%"
            ),
            TrendTOPCoinEntity(
                id: "bittensor",
                name: "Bittensor",
                symbol: "TAO",
                image: "https://coin-images.coingecko.com/coins/images/28452/standard/ARUsPeNQ_400x400.jpeg",
                price: "258,679 KRW",
                changePercentage: "+9.94%"
            ),
            TrendTOPCoinEntity(
                id: "sui",
                name: "Sui",
                symbol: "SUI",
                image: "https://coin-images.coingecko.com/coins/images/26375/standard/sui-ocean-square.png",
                price: "2,120 KRW",
                changePercentage: "+0.72%"
            ),
            TrendTOPCoinEntity(
                id: "nusd",
                name: "sUSD",
                symbol: "SUSD",
                image: "https://coin-images.coingecko.com/coins/images/5013/standard/sUSD.png",
                price: "732 KRW",
                changePercentage: "-4.65%"
            ),
            TrendTOPCoinEntity(
                id: "pi-network",
                name: "Pi Network",
                symbol: "PI",
                image: "https://coin-images.coingecko.com/coins/images/54342/standard/pi_network.jpg",
                price: "609 KRW",
                changePercentage: "+0.74%"
            ),
            TrendTOPCoinEntity(
                id: "official-trump",
                name: "Official Trump",
                symbol: "TRUMP",
                image: "https://coin-images.coingecko.com/coins/images/53746/standard/trump.png",
                price: "7,560 KRW",
                changePercentage: "-3.45%"
            ),
            TrendTOPCoinEntity(
                id: "ethereum",
                name: "Ethereum",
                symbol: "ETH",
                image: "https://coin-images.coingecko.com/coins/images/279/standard/ethereum.png",
                price: "1,584,488 KRW",
                changePercentage: "-1.06%"
            ),
            TrendTOPCoinEntity(
                id: "berachain-bera",
                name: "Berachain",
                symbol: "BERA",
                image: "https://coin-images.coingecko.com/coins/images/25235/standard/BERA.png",
                price: "3,450 KRW",
                changePercentage: "-8.39%"
            ),
            TrendTOPCoinEntity(
                id: "movement",
                name: "Movement",
                symbol: "MOVE",
                image: "https://coin-images.coingecko.com/coins/images/39345/standard/movement-testnet-token.png",
                price: "238 KRW",
                changePercentage: "-3.32%"
            ),
            TrendTOPCoinEntity(
                id: "jupiter-exchange-solana",
                name: "Jupiter",
                symbol: "JUP",
                image: "https://coin-images.coingecko.com/coins/images/34188/standard/jup.png",
                price: "379 KRW",
                changePercentage: "+2.43%"
            ),
            TrendTOPCoinEntity(
                id: "magic-eden",
                name: "Magic Eden",
                symbol: "ME",
                image: "https://coin-images.coingecko.com/coins/images/39850/standard/_ME_Profile_Dark_2x.png",
                price: "805 KRW",
                changePercentage: "-2.10%"
            ),
            TrendTOPCoinEntity(
                id: "aergo",
                name: "Aergo",
                symbol: "AERGO",
                image: "https://coin-images.coingecko.com/coins/images/4490/standard/aergo.png",
                price: "253 KRW",
                changePercentage: "+55.70%"
            ),
            TrendTOPCoinEntity(
                id: "babylon",
                name: "Babylon",
                symbol: "BABY",
                image: "https://coin-images.coingecko.com/coins/images/55092/standard/Baby-Symbol-Mint_%281%29.png",
                price: "76 KRW",
                changePercentage: "-9.70%"
            )
        ]
    }
    
    func getTrendNft() -> [TrendTOPNftEntity] {
        return [
            TrendTOPNftEntity(
                id: "otherside-koda",
                name: "Otherside Koda",
                symbol: "KODA",
                image: "https://coin-images.coingecko.com/nft_contracts/images/3167/standard/otherside-koda.png",
                floorPrice: "1.41 ETH",
                changePercentage: "+19.13%"
            ),
            TrendTOPNftEntity(
                id: "taproot-wizards",
                name: "Taproot Wizards",
                symbol: "TAPROOT_WIZARDS",
                image: "https://coin-images.coingecko.com/nft_contracts/images/15726/standard/taproot-wizards.jpg",
                floorPrice: "0.18 BTC",
                changePercentage: "+8.83%"
            ),
            TrendTOPNftEntity(
                id: "ordinal-maxi-biz-omb",
                name: "Ordinal Maxi Biz (OMB)",
                symbol: "OMB",
                image: "https://coin-images.coingecko.com/nft_contracts/images/3256/standard/ordinal-maxi-biz-omb.jpg",
                floorPrice: "0.026 BTC",
                changePercentage: "+2.66%"
            ),
            TrendTOPNftEntity(
                id: "mutant-ape-yacht-club",
                name: "Mutant Ape Yacht Club",
                symbol: "MAYC",
                image: "https://coin-images.coingecko.com/nft_contracts/images/104/standard/mayc.png",
                floorPrice: "2.48 ETH",
                changePercentage: "+1.06%"
            ),
            TrendTOPNftEntity(
                id: "doodles-official",
                name: "Doodles",
                symbol: "DOODLE",
                image: "https://coin-images.coingecko.com/nft_contracts/images/242/standard/3R7s-ZV0_400x400.jpg",
                floorPrice: "2.91 ETH",
                changePercentage: "+0.94%"
            ),
            TrendTOPNftEntity(
                id: "mad-lads",
                name: "Mad Lads",
                symbol: "MLADS",
                image: "https://coin-images.coingecko.com/nft_contracts/images/3187/standard/mad-lads.png",
                floorPrice: "48.99 SOL",
                changePercentage: "+0.43%"
            ),
            TrendTOPNftEntity(
                id: "degods-solana",
                name: "DeGods (Solana)",
                symbol: "DGOD",
                image: "https://coin-images.coingecko.com/nft_contracts/images/2430/standard/degods.png",
                floorPrice: "8.52 SOL",
                changePercentage: "+0.25%"
            )
        ]
    }
}
