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
            Text("SearchView")
        }
        .searchable(
            text: $keyword,
            placement: .navigationBarDrawer,
            prompt: StringLiteral.placeHolder.text
        )
    }
    
//    private func searchResultCell(_ entity:) -> some View {
//        HStack {
//            IconImageCell(url: <#T##String#>)
//        }
//    }
}

extension SearchView {
    enum StringLiteral: String {
        case placeHolder = "코인 이름을 검색하세요"
        
        var text: String {
            return self.rawValue
        }
    }
}

#Preview {
    
    let searchRP = DummySearchRepository()
    let searchVM = SearchViewModel(searchRepository: searchRP)
    SearchView(viewModel: searchVM)
}
