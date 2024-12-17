//
//  CacheManager.swift
//  StocksSearch
//
//  Created by HAWER TORRES on 16/12/24.
//

import Foundation

actor CacheManager {
    private var cache: [String: Stock] = [:]
    private let localData: StockDataStore
    
    init(localData: StockDataStore) {
        self.localData = localData
        cache = localData.get()
    }
    
    func cacheStocks(_ stocks: [Stock]) {
        for stock in stocks {
            cache[stock.ticker.uppercased()] = stock
        }
        
        localData.save(data: cache)
    }
    
    func getStock(for ticker: String) -> Stock? {
        return cache[ticker.uppercased()]
    }
    
    func getAllStocks() -> [Stock] {
        return Array(cache.values)
    }
}
