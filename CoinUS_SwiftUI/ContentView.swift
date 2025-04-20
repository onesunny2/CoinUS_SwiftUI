//
//  ContentView.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/18/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    
    let tabItems = [
        TabItem(icon: ImageLiterals.trend),
        TabItem(icon: ImageLiterals.search),
        TabItem(icon: ImageLiterals.wallet)
    ]
    
    var body: some View {

        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                
                let trendRP = DummyTrendRepository()
                let favoriteRP = DummyFavoriteRepository()
                let trendVM = TrendViewModel(trendRepository: trendRP, favoriteRepository: favoriteRP)
                NavigationView {
                    TrendView(viewModel: trendVM)
                        .navigationTitle(Title.trend.text)
                        .navigationBarTitleDisplayMode(.large)
                }
                .tag(0)
                
                let searchRP = DummySearchRepository()
                let searchVM = SearchViewModel(searchRepository: searchRP)
                NavigationView {
                    SearchView(viewModel: searchVM)
                        .navigationTitle(Title.search.text)
                        .navigationBarTitleDisplayMode(.large)
                }
                .tag(1)
                
                NavigationView {
                    FavoriteView()
                        .navigationTitle(Title.favorite.text)
                        .navigationBarTitleDisplayMode(.large)
                }
                .tag(2)
            }
            
            CustomCoinTabView(selectedTab: $selectedTab, tabItems: tabItems)
        }
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
