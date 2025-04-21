//
//  ChartView.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI
import DGCharts

struct ChartView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: ChartViewModel
    
    var body: some View {
        chartContent
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
        .navigationBar(leading: {
            toolBarLeft
        }, trailing: {
            tooBarRight
        })
        .onAppear {
            viewModel.action(.onAppear)
        }
        .redacted(reason: viewModel.output.isLoading ? .placeholder : [])
    }
    
    private var toolBarLeft: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: ImageLiterals.chevronLeft)
                .setSystemImage(size: 18, weight: .regular)
        }
    }
    
    private var tooBarRight: some View {
        Button {
            viewModel.action(.favorite)
        } label: {
            Image(systemName: (viewModel.output.chartInfo?.isFavorite ?? false) ? ImageLiterals.starFill : ImageLiterals.star)
                .setSystemImage(size: 15, weight: .regular)
        }
    }
    
    @ViewBuilder
    private var chartContent: some View {
        VStack(alignment: .leading) {
            if let coin = viewModel.output.chartInfo {
                topName(coin)
                todayPrice(coin)
                priceInfo(coin)
                    .padding(.top, 12)
                chartView
                updateText(coin)
            }
        }
    }
    
    private func topName(_ coin: ChartCoinEntity) -> some View {
        HStack {
            IconImageCell(url: coin.image)
            Text(coin.name)
                .setBasic(size: 30, weight: .semibold)
            Spacer()
        }
    }
    
    private func todayPrice(_ coin: ChartCoinEntity) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(coin.currentPrice)
                .setBasic(size: 30, weight: .semibold)
            
            HStack(alignment: .center, spacing: 6) {
                Text(coin.changePercentage)
                    .setBasic(size: 16, weight: .medium, color: coin.statusColor)
                Text(StringLiteral.오늘.text)
                    .setBasic(size: 16, weight: .medium, color: .gray)
            }
        }
    }
    
    private func priceInfo(_ coin: ChartCoinEntity) -> some View {
        HStack(spacing: 80) {
            priceHstackCell(
                StringLiteral.고가.text,
                coin.high24h,
                StringLiteral.신고점.text,
                coin.allTimeHighPrice
            )
            
            priceHstackCell(
                StringLiteral.저가.text,
                coin.low24h,
                StringLiteral.신저점.text,
                coin.allTimeLowPrice
            )
        }
    }
    
    @ViewBuilder
    private var chartView: some View {
        if let data = viewModel.output.lineChartData {
            CoinChartView(chartDataSet: data.0, chartData: data.1)
                .frame(maxWidth: .infinity)
        }
    }
    
    private func updateText(_ coin: ChartCoinEntity) -> some View {
        HStack {
            Spacer()
            Text(coin.lastUpdate)
                .setBasic(size: 12, weight: .semibold, color: .gray)
        }
        .padding([.trailing, .bottom], 20)
    }
    
    private func priceHstackCell(
        _ topTitle: String,
        _ topPrice: String,
        _ btmTitle: String,
        _ btmPrice: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 6) {
                Text(topTitle)
                    .setBasic(size: 18, weight: .semibold, color: (topTitle == StringLiteral.고가.text) ? .red : .blue)
                Text(topPrice)
                    .setBasic(size: 18, weight: .regular)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(btmTitle)
                    .setBasic(size: 18, weight: .semibold, color: (btmTitle == StringLiteral.신고점.text) ? .red : .blue)
                Text(btmPrice)
                    .setBasic(size: 18, weight: .regular)
            }
        }
    }
}

extension ChartView {
    enum StringLiteral: String {
        case 오늘 = "Today"
        case 고가
        case 저가
        case 신고점
        case 신저점
        
        var text: String {
            return self.rawValue
        }
    }
}
