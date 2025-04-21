//
//  TrendView.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI

struct TrendView: View {
    
    @StateObject var viewModel: TrendViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 40) {
                if viewModel.output.favoriteItems.count >= 2 {
                    favoriteList
                }
                TrendTopGridCell(title: StringLiteral.topCoin.text, trendData: viewModel.output.trendCoinItems, trendType: .coin)
                TrendTopGridCell(title: StringLiteral.topNft.text, trendData: viewModel.output.trendNftItems, trendType: .nft)
            }
        }
        .padding(.top, 10)
        .onAppear {
            viewModel.action(.onAppear)
        }
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
                    ForEach(viewModel.output.favoriteItems, id: \.id) { coin in
                        NavigationLink {
                            ChartView()
                        } label: {
                            FavoriteCoinCell(favoriteData: coin, type: .trend)
                        }
                    }
                    
                    // 옵션 기능 (나중에)
//                    if viewModel.output.isOverFourth {
//                        Button {
//                            // 탭 이동시키기
//                        } label: {
//                            
//                        }

//                    }
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
    TrendView(
        viewModel: TrendViewModel(trendRepository: DummyTrendRepository(), favoriteRepository: DummyFavoriteRepository())
    )
}
