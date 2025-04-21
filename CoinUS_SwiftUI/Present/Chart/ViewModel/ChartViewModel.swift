//
//  ChartViewModel.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/21/25.
//

import Foundation
import Combine
import DGCharts

final class ChartViewModel: ViewModelType {
    
    var input = Input()
    @Published var output = Output()
    
    var cancellables = Set<AnyCancellable>()
    
    private let id: String
    private let chartRepository: ChartRepository
    private let appStorageManager = AppStorageManager.shared
    
    init(
        id: String,
        chartRepository: ChartRepository
    ) {
        self.id = id
        self.chartRepository = chartRepository
        transform()
    }
}

extension ChartViewModel {
    
    typealias Chart = (LineChartDataSet, LineChartData)
    
    struct Input {
        var onAppear = PassthroughSubject<Void, Never>()
        var tappedFavoriteButton = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var chartInfo: ChartCoinEntity?
        var isLoading: Bool = false
        var lineChartData: Chart?
    }
    
    func transform() {
        input.onAppear
            .sink { [weak self] _ in
                guard let self else { return }
                Task {
                    await self.getChartData()
                }
            }
            .store(in: &cancellables)
        
        input.tappedFavoriteButton
            .sink { [weak self] _ in
                guard let self else { return }
                self.appStorageManager.AddRemoveFavoriteItem(id)
                Task {
                    self.output.isLoading = true
                    await self.getChartData()
                    self.output.isLoading = false
                }
            }
            .store(in: &cancellables)
    }
    
    private func getChartData() async {
        let chartInfo = await chartRepository.getChartCoinInfo(id)
        output.chartInfo = chartInfo
        output.lineChartData = getChartData(weekPrice: chartInfo?.sparkLine ?? [])
    }
    
    private func getChartData(weekPrice: [Double]) -> Chart {
        
        var chartEntry: [ChartDataEntry] = []
        
        let priceDataEntry = weekPrice.map {
            ((weekPrice.firstIndex(of: $0) ?? 0) + 1, $0)
        }
        
        priceDataEntry.forEach {
            let chartData = ChartDataEntry(x: Double($0.0), y: $0.1)
            chartEntry.append(chartData)
        }
        
        let chartDataSet = LineChartDataSet(entries: chartEntry)
        let chartData = LineChartData(dataSet: chartDataSet)
        
        return (chartDataSet, chartData)
    }
}

extension ChartViewModel {
    enum Action {
        case onAppear
        case favorite
    }
    
    func action(_ action: Action) {
        switch action {
        case .onAppear: input.onAppear.send(())
        case .favorite: input.tappedFavoriteButton.send(())
        }
    }
}
