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
    
    init(searchRepository: SearchRepository) {
        self.searchRepository = searchRepository
        
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
    }
    
    func transform() {
        input.tappedSearchButton
            .sink { [weak self] keyword in
                guard let self else { return }
                // TODO: 실제 네트워크 통신 시에는 키워드에 대한 결과 나오도록 잘 받아야 함
                self.getSearchResults(keyword)
            }
            .store(in: &cancellables)
    }
    
    private func getSearchResults(_ keyword: String) {
        output.searchResults = searchRepository.getSearchInfo(keyword)
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
