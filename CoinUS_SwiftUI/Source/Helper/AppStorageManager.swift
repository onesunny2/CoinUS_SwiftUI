//
//  AppStorageManager.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/20/25.
//

import SwiftUI

final class AppStorageManager: ObservableObject {
    static let shared = AppStorageManager()
    private init() { }
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    @AppStorage(UserDafaultsKey.coinItems.key) private var coinItemsData: Data = Data()
    
    private var coinItems: [String] {
        get {
            guard let decoded = try? decoder.decode([String].self, from: coinItemsData) else { return [] }
            return decoded
        }
        set {
            guard let encoded = try? encoder.encode(newValue) else { return }
            coinItemsData = encoded
        }
    }
    
    func loadFavoriteItem() -> [String] {
        return coinItems
    }
    
    func AddRemoveFavoriteItem(_ item: String) {
        var lists = coinItems
        guard !lists.contains(item) else {
            // delete
            lists.removeAll { $0 == item }
            coinItems = lists
            return
        }
        // add
        guard lists.count < 10 else {
            // TODO: 토스트 메시지 -> 10개까지만 가능하다
            print("저장된 코인 10개 초과")
            return
        }
        
        lists.append(item)
        coinItems = lists
    }
    
    func checkFavoriteItem(_ item: String) -> Bool {
        return coinItems.contains(item)
    }
    
    private func addFavoriteItem(_ item: String) {
        var lists = coinItems
        guard !lists.contains(item) else { return }
        guard lists.count < 10 else {
            // TODO: 토스트 메시지 -> 10개까지만 가능하다
            return
        }
        
        lists.append(item)
        coinItems = lists
    }
    
    private func removeFavoriteItem(_ item: String) {
        var lists = coinItems
        lists.removeAll { $0 == item }
        coinItems = lists
    }
}
