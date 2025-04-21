//
//  FavoriteViewModel.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/21/25.
//

import Foundation
import Combine

final class FavoriteViewModel: ViewModelType {
    
    var input = Input()
    @Published var output = Output()
    
    var cancellables = Set<AnyCancellable>()
    
    private let favoriteRepository: FavoriteRepository
    
    init(favoriteRepository: FavoriteRepository) {
        self.favoriteRepository = favoriteRepository
        transform()
    }
}

extension FavoriteViewModel {
    
    struct Input {
        var onAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var favoriteItems: [FavoriteCoinEntity] = []
        var isLoading: Bool = true
    }
    
    func transform() {
        input.onAppear
            .sink { [weak self] _ in
                guard let self else { return }
                Task {
                    self.output.isLoading = true
                    await self.getFavoriteCoinInfo()
                    self.output.isLoading = false
                }
            }
            .store(in: &cancellables)
    }
    
    private func getFavoriteCoinInfo() async {
        
        let favoriteInfo = await favoriteRepository.getFavoriteInfo(type: .favorite)
        output.favoriteItems = favoriteInfo
    }
}

extension FavoriteViewModel {
    enum Action {
        case onAppear
    }
    
    func action(_ action: Action) {
        switch action {
        case .onAppear: input.onAppear.send(())
        }
    }
}
