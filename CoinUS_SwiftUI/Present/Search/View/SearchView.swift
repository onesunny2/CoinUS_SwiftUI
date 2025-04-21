//
//  SearchView.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel
    
    @State private var keyword: String = ""
    
    var body: some View {
        VStack {
            if viewModel.output.isResultEmpty {
                noResult
            } else {
                searchResultScroll(viewModel.output.searchResults)
            }
        }
        .searchable(
            text: $keyword,
            placement: .navigationBarDrawer,
            prompt: StringLiteral.placeHolder.text
        )
        .onSubmit(of: .search) {
            viewModel.action(.search(keyword: keyword))
        }
        .redacted(reason: viewModel.output.isLoading ? .placeholder : [])
    }
    
    private var noResult: some View {
        Text(StringLiteral.noResult.text)
            .setBasic(size: 20, weight: .regular)
    }
    
    private func searchResultScroll(_ entity: [SearchCoinEntity]) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(entity, id: \.id) { coin in
                    NavigationLink {
                        let chartRP = DefaultChartRepository()
                        let chartVM = ChartViewModel(id: coin.id, chartRepository: chartRP)
                        ChartView(viewModel: chartVM)
                    } label: {
                        searchResultCell(coin)
                    }
                }
            }
            .padding(20)
        }
    }
    
    private func searchResultCell(_ coin: SearchCoinEntity) -> some View {
        HStack(alignment: .center, spacing: 10) {
            IconImageCell(url: coin.image)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(coin.name)
                    .setBasic(size: 16, weight: .bold)
                    .lineLimit(1)
                Text(coin.symbol)
                    .setBasic(size: 12, weight: .regular, color: .gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            Button {
                viewModel.action(.favorite(id: coin.id))
            } label: {
                Image(systemName: coin.isFavorite ? ImageLiterals.starFill : ImageLiterals.star)
                    .setSystemImage(size: 20, weight: .medium)
            }
        }
    }
}

extension SearchView {
    enum StringLiteral: String {
        case placeHolder = "코인 이름을 검색하세요"
        case noResult = "검색결과가 없습니다"
        
        var text: String {
            return self.rawValue
        }
    }
}

#Preview {
    
    let searchRP = DummySearchRepository()
    let searchVM = SearchViewModel(searchRepository: searchRP, appStorageManager: AppStorageManager.shared)
    SearchView(viewModel: searchVM)
}
