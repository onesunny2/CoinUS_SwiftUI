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
                TrendView()
                    .tag(0)
                
                SearchView()
                    .tag(1)
                
                FavoriteView()
                    .tag(2)
            }
            
            CustomCoinTabView(selectedTab: $selectedTab, tabItems: tabItems)
        }
    }
}

#Preview {
    ContentView()
}
