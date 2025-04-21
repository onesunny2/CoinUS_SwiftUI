//
//  CoinChartView.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/21/25.
//

import SwiftUI
import DGCharts

struct CoinChartView: UIViewRepresentable {
    
    var chartDataSet: LineChartDataSet
    var chartData: LineChartData
    var chartColor: UIColor = .systemMint
    
    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        
        chart.rightAxis.enabled = false
        chart.leftAxis.enabled = false
        chart.highlightPerTapEnabled = false
        chart.dragEnabled = false
        chart.legend.enabled = false
        chart.drawGridBackgroundEnabled = false
        chart.chartDescription.enabled = false
        chart.pinchZoomEnabled = false
        chart.drawBordersEnabled = false
        chart.xAxis.enabled = false
        chart.backgroundColor = .systemBackground
        
        return chart
    }
    
    func updateUIView(_ chart: LineChartView, context: Context) {

        chartDataSet.mode = .cubicBezier
        chartDataSet.drawValuesEnabled = false
        chartDataSet.drawCircleHoleEnabled = false
        chartDataSet.drawCirclesEnabled = false
        chartDataSet.setColor(chartColor)
        chartDataSet.lineWidth = 2
        
        // 그라데이션 배경 설정
        let gradientColors: [CGColor] = [
            chartColor.cgColor,
            chartColor.withAlphaComponent(0.5).cgColor,
            chartColor.withAlphaComponent(0.1).cgColor
        ]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        chartDataSet.fill = LinearGradientFill(gradient: gradient, angle: 270)
        chartDataSet.fillAlpha = 1
        chartDataSet.drawFilledEnabled = true
        
        // 데이터 적용 및 애니메이션
        chart.data = chartData
        chart.animate(xAxisDuration: 1.5, easingOption: .easeInOutSine)
    }
}
