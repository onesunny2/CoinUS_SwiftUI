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
    }
    
    func transform() {
        input.onAppear
            .sink { [weak self] _ in
                guard let self else { return }
                self.getTrendCoinInfo()
                self.getTrendNftInfo()
                self.getFavoriteCoinInfo()
            }
            .store(in: &cancellables)
    }
    
    private func getTrendCoinInfo() {
        output.trendCoinItems = trendRepository.getTrendInfo(type: .coin)
    }
    
    private func getTrendNftInfo() {
        output.trendNftItems = trendRepository.getTrendInfo(type: .nft)
    }
    
    private func getFavoriteCoinInfo() {
        output.favoriteItems = favoriteRepository.getFavoriteInfo(type: .trend)
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
