//
//  TrendView.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI

struct TrendView: View {
    
    let dummyData: TrendRepository
    let favoriteData: FavoriteRepository

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {
                favoriteList
                TrendTopGridCell(title: StringLiteral.topCoin.text, trendData: dummyData, trendType: .coin)
                TrendTopGridCell(title: StringLiteral.topNft.text, trendData: dummyData, trendType: .nft)
            }
        }
        .padding(.top, 10)
    }
    
    private var favoriteTitle: some View {
        Text(StringLiteral.favorite.text)
            .setBasic(size: 20, weight: .bold)
            .padding(.leading, 20)
    }
    
    private var favoriteList: some View {
        VStack(alignment: .leading, spacing: 10) {
            favoriteTitle
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(favoriteData.getFavoriteInfo(type: .trend), id: \.id) { coin in
                        FavoriteCoinCell(favoriteData: coin, type: .trend)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

extension TrendView {
    enum StringLiteral: String {
        case favorite = "My Favorite"
        case topCoin = "Top15 Coin"
        case topNft = "Top7 NFT"
        
        var text: String {
            return self.rawValue
        }
    }
}

#Preview {
    TrendView(dummyData: DummyTrendRepository(), favoriteData: DummyFavoriteRepository())
}
