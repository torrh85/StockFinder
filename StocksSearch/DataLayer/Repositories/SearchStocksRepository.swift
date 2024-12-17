//
//  SearchStocksRepository.swift
//  StocksSearch
//
//  Created by HAWER TORRES on 16/12/24.
//

import Foundation

protocol SearchStocksRepository {
    func searchStock(searchText: String) async throws -> [Stock]
    func cachedStocks() async -> [Stock]
}

class SearchStocksAPIRepository: SearchStocksRepository {
    let network: Networking
    private let cache: CacheManager
    private var stocks: [Stock] = []
    
    init(network: Networking = NetworkProvider(), localData: StockDataStore = StockAPIDataStore()) {
        self.network = network
        cache = CacheManager(localData: localData)
    }
    
    static var `default`: SearchStocksRepository {
        return SearchStocksAPIRepository()
    }
    
    func cachedStocks() async -> [Stock] {
        return await cache.getAllStocks()
    }
    
    func searchStock(searchText: String) async throws -> [Stock] {
        guard !searchText.isEmpty else {
            return await cachedStocks()
        }

        if let cacheStock = await cache.getStock(for: searchText.uppercased()) {
            return [cacheStock]
        }
        
        if stocks.isEmpty {
            stocks = try await network.fetch(resource: .init(.search))
        }
 
        let filteredStocks = stocks.filter { $0.name.localizedCaseInsensitiveContains(searchText) || $0.ticker.localizedCaseInsensitiveContains(searchText)}
        
        await cache.cacheStocks(filteredStocks)
        
        return filteredStocks
    }
}
