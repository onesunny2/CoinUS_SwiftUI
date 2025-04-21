//
//  TrendTopGrid.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI

struct TrendTopGridCell: View {
    
    let title: String
    let trendData: [TrendTOPEntity]
    let trendType: TrendType
    
    private let rows: [GridItem] = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            topCoinTitle
            topCoinGrid()
            
        }
    }
    
    private var topCoinTitle: some View {
        Text(title)
            .setBasic(size: 20, weight: .bold)
            .padding(.leading, 20)
    }
    
    private func topCoinGrid() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 0) {
                topCoinForEach()
            }
            .frame(height: 200)
        }
    }
    
    private func topCoinForEach() -> some View {
        ForEach(trendData.indices, id: \.self) { index in
            
            let coin = trendData[index]
            let truncatedName = coin.name.count > 12 ? coin.name.prefix(12) + "..." : coin.name
            let truncatedSymbol = coin.symbol.count > 12 ? coin.symbol.prefix(12) + "..." : coin.symbol
            
            VStack(spacing: 0) {
                
                switch trendType {
                case .coin:
                    NavigationLink {
                        let chartRP = DefaultChartRepository()
                        let chartVM = ChartViewModel(id: coin.id, chartRepository: chartRP)
                        ChartView(viewModel: chartVM)
                    } label: {
                        cellArea(at: index, coin: coin, truncatedName: truncatedName, truncatedSymbol: truncatedSymbol)
                    }
                case .nft:
                    cellArea(at: index, coin: coin, truncatedName: truncatedName, truncatedSymbol: truncatedSymbol)
                }
                
                if (index + 1) % 3 != 0 {
                    Rectangle()
                        .fill(.gray.opacity(0.5))
                        .frame(maxWidth: .infinity, maxHeight: 1)
                }
            }
            .padding(.horizontal, 30)
        }
    }
    
    private func cellArea(at index: Int, coin: TrendTOPEntity, truncatedName: String, truncatedSymbol: String) -> some View {
        HStack(alignment: .center, spacing: 12) {
            Text("\(index + 1)")
                .setBasic(size: 20, weight: .semibold)
            IconImageCell(url: coin.image)
            
            VStack(alignment: .leading) {
                Text(truncatedName)
                    .setBasic(size: 16, weight: .semibold)
                Text(truncatedSymbol)
                    .setBasic(size: 14, weight: .regular)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(coin.price)
                    .setBasic(size: 16, weight: .medium)
                Text(coin.changePercentage)
                    .setBasic(size: 14, weight: .regular, color: coin.statusColor)
            }
        }
        .padding(.vertical, 12)
    }
}
