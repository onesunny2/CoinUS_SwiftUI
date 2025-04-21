//
//  ContentView.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/18/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            let appStorage = AppStorageManager.shared
            
            let trendRP = DefaultTrendRepository()
            let favoriteRP = DefaultFavoriteRepository()
            let trendVM = TrendViewModel(trendRepository: trendRP, favoriteRepository: favoriteRP)
            NavigationView {
                TrendView(viewModel: trendVM)
                    .navigationTitle(Title.trend.text)
                    .navigationBarTitleDisplayMode(.large)
            }
            .tabItem {
                Image(systemName: ImageLiterals.trend)
            }
            .tag(0)
            
            let searchRP = DefaultSearchRepository()
            let searchVM = SearchViewModel(searchRepository: searchRP, appStorageManager: appStorage)
            NavigationView {
                SearchView(viewModel: searchVM)
                    .navigationTitle(Title.search.text)
                    .navigationBarTitleDisplayMode(.large)
            }
            .tabItem {
                Image(systemName: ImageLiterals.search)
            }
            .tag(1)
            
            let favoriteVM = FavoriteViewModel(favoriteRepository: favoriteRP)
            NavigationView {
                FavoriteView(viewModel: favoriteVM)
                    .navigationTitle(Title.favorite.text)
                    .navigationBarTitleDisplayMode(.large)
            }
            .tabItem {
                Image(systemName: ImageLiterals.wallet)
            }
            .tag(2)
        }
        .tint(.mint)
    }
}

extension ContentView {
    enum Title: String {
        case trend = "Crypto Coin"
        case search = "Search"
        case favorite = "Favorite Coin"
        
        var text: String {
            return self.rawValue
        }
    }
}

#Preview {
    ContentView()
}
