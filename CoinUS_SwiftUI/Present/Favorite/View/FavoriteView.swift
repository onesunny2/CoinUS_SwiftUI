//
//  FavoriteView.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/19/25.
//

import SwiftUI

struct FavoriteView: View {
    
    @StateObject var viewModel: FavoriteViewModel
    
    private let columns: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.width / 2 - 10), spacing: 0),
        GridItem(.fixed(UIScreen.main.bounds.width / 2 - 10), spacing: 0)
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            FavoriteCoinsGrid()
        }
        .onAppear {
            viewModel.action(.onAppear)
        }
    }
    
    private func FavoriteCoinsGrid() -> some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(viewModel.output.favoriteItems, id: \.id) { coin in
                NavigationLink {
                    ChartView()
                } label: {
                    FavoriteCoin(coin)
                }
            }
        }
        .padding(.vertical, 20)
    }
    
    private func FavoriteCoin(_ coin: FavoriteCoinEntity) -> some View {
        FavoriteCoinCell(favoriteData: coin, type: .favorite)
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    let vm = FavoriteViewModel(favoriteRepository: DummyFavoriteRepository())
    FavoriteView(viewModel: vm)
}
