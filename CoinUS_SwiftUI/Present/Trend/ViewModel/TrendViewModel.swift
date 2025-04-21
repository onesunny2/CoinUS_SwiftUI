//
//  TrendViewModel.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/20/25.
//

import Foundation
import Combine

final class TrendViewModel: ViewModelType {
    
    var input = Input()
    @Published var output = Output()
    
    var cancellables = Set<AnyCancellable>()
    
    private let trendRepository: TrendRepository
    private let favoriteRepository: FavoriteRepository
    
    init(trendRepository: TrendRepository, favoriteRepository: FavoriteRepository) {
        self.trendRepository = trendRepository
        self.favoriteRepository = favoriteRepository
        
        transform()
    }
}

extension TrendViewModel {
    
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var favoriteItems: [FavoriteCoinEntity] = []
        var trendCoinItems: [TrendTOPEntity] = []
        var trendNftItems: [TrendTOPEntity] = []
        var isOverFourth: Bool = false
        var isLoading: Bool = true
    }
    
    func transform() {
        input.onAppear
            .sink { [weak self] _ in
                guard let self else { return }
                Task {
                    self.output.isLoading = true
                    await self.getTrendCoinInfo()
                    await self.getTrendNftInfo()
                    await self.getFavoriteCoinInfo()
                    self.output.isLoading = false
                }
            }
            .store(in: &cancellables)
    }
    
    private func getTrendCoinInfo() async {
        let trendCoinInfo = await trendRepository.getTrendInfo(type: .coin)
        output.trendCoinItems = trendCoinInfo
    }
    
    private func getTrendNftInfo() async {
        let trendNftInfo = await trendRepository.getTrendInfo(type: .nft)
        output.trendNftItems = trendNftInfo
    }
    
    private func getFavoriteCoinInfo() async {
        
        let favoriteInfo = await favoriteRepository.getFavoriteInfo(type: .trend)
        
        guard favoriteInfo.count > 3 else {
            output.favoriteItems = favoriteInfo
            return
        }
        output.favoriteItems = Array(favoriteInfo[0...2])
        output.isOverFourth = true
    }
}

extension TrendViewModel {
    enum Action {
        case onAppear
    }
    
    func action(_ action: Action) {
        switch action {
        case .onAppear: input.onAppear.send(())
        }
    }
}
