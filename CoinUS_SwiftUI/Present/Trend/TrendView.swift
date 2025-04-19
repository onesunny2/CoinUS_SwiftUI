//
//  TrendView.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI

struct TrendView: View {
    
    let dummyData: TrendRepository

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {
                favoriteTitle
                TrendTopGridCell(title: StringLiteral.topCoin.text, trendData: dummyData, trendType: .coin)
                TrendTopGridCell(title: StringLiteral.topNft.text, trendData: dummyData, trendType: .nft)
            }
        }
    }
    
    private var favoriteTitle: some View {
        Text(StringLiteral.favorite.text)
            .setBasic(size: 20, weight: .bold)
            .padding(.leading, 20)
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
    TrendView(dummyData: DummyTrendRepository())
}
