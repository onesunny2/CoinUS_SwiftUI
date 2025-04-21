//
//  FavoriteCoinCell.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI

struct FavoriteCoinCell: View {
    
    let favoriteData: FavoriteCoinEntity
    let type: FavoriteType
    
    var body: some View {
        VStack(alignment: (type == .trend) ? .leading : .trailing, spacing: 40) {
            topElements
            bottomElements
        }
        .padding(16)
        .background(alignment: .center) {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color((type == .trend) ? .systemGray6 : .systemBackground))
                .shadow(color: Color(.systemGray4).opacity(0.3), radius: (type == .trend) ? 0 : 6)
        }
    }
    
    private var topElements: some View {
        HStack {
            IconImageCell(url: favoriteData.image)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(favoriteData.name)
                    .setBasic(size: 16, weight: .medium)
                    .lineLimit(1)
                
                Text(favoriteData.symbol)
                    .setBasic(size: 12, weight: .regular, color: .gray)
            }
            
        } .padding(.trailing, (type == .trend) ? 80 : 60)
    }
    
    private var bottomElements: some View {
        VStack(alignment: (type == .trend) ? .leading : .trailing, spacing: 6) {
            Text(favoriteData.currentPrice)
                .setBasic(size: 16, weight: .medium)
            
            Text(favoriteData.changePercentage)
                .setBasic(size: 12, weight: .medium, color: favoriteData.statusColor)
                .padding(.horizontal, (type == .trend) ? 0 : 8)
                .padding(.vertical, (type == .trend) ? 0 : 4)
                .background((type == .trend) ? .clear : favoriteData.backgroundColor)
                .cornerRadius(4)
        }
    }
}

//#Preview {
//    // 더미 데이터 직접 생성
//    let dummyData = FavoriteCoinEntity(
//        id: "bitcoin",
//        name: "Bitcoin", symbol: "btc",
//        image: "bitcoin_image_url",
//        currentPrice: "68000.0",
//        changePercentage: "2.5"
//    )
//    
//    FavoriteCoinCell(favoriteData: dummyData, type: .favorite)
//        .padding(.horizontal, 20)
//}
