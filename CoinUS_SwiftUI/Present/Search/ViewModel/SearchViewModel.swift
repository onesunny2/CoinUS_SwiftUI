//
//  SearchViewModel.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/21/25.
//

import Foundation
import Combine

final class SearchViewModel: ViewModelType {
    
    var input = Input()
    @Published var output = Output()
    
    var cancellables = Set<AnyCancellable>()
    
    private let searchRepository: SearchRepository
    private let appStorageManager: AppStorageManager
    
    private var keyword = ""
    
    init(searchRepository: SearchRepository, appStorageManager: AppStorageManager) {
        self.searchRepository = searchRepository
        self.appStorageManager = appStorageManager
        transform()
    }
}

extension SearchViewModel {
    
    struct Input {
        var tappedSearchButton = PassthroughSubject<String, Never>()
        var tappedFavoriteButton = PassthroughSubject<String, Never>()
    }
    
    struct Output {
        var searchResults: [SearchCoinEntity] = []
        var isResultEmpty: Bool = false
        var isLoading: Bool = false
        var isFavorite: Bool = false
    }
    
    func transform() {
        input.tappedSearchButton
            .sink { [weak self] keyword in
                guard let self else { return }
                self.keyword = keyword
                
                Task {
                    self.output.isLoading = true
                    await self.getSearchResults(keyword)
                    self.output.isLoading = false
                }
            }
            .store(in: &cancellables)
        
        input.tappedFavoriteButton
            .sink { [weak self] id in
                guard let self else { return }
                appStorageManager.AddRemoveFavoriteItem(id)
                Task {
                    await self.getSearchResults(self.keyword)
                }
            }
            .store(in: &cancellables)
    }
    
    private func getSearchResults(_ keyword: String) async {
        let searchInfo = await searchRepository.getSearchInfo(keyword)
        output.searchResults = searchInfo
        guard output.searchResults.isEmpty else {
            output.isResultEmpty = false
            return
        }
        output.isResultEmpty = true
    }
}

extension SearchViewModel {
    enum Action {
        case search(keyword: String)
        case favorite(id: String)
    }
    
    func action(_ action: Action) {
        switch action {
        case let .search(keyword): input.tappedSearchButton.send(keyword)
        case let .favorite(id): input.tappedFavoriteButton.send(id)
        }
    }
}
