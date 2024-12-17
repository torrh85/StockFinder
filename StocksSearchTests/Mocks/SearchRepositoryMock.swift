//
//  SearchRepositoryMock.swift
//  StocksSearchTests
//
//  Created by HAWER TORRES on 16/12/24.
//

import Foundation
@testable import StocksSearch

struct SearchRepositoryMock: SearchStocksRepository {
    private let error: NetworkError?
    private let cacheStock: [Stock]
    private let searchResults: [Stock]
    
    init(
        error: NetworkError? = nil,
        cacheStock: [Stock] = [
            Stock(currentPrice: 456.90, ticker: "APPL", name: "APPLE"),
            Stock(currentPrice: 12.56, ticker: "NU", name: "NUBANK"),
            Stock(currentPrice: 124.68, ticker: "BAC", name: "BANK OF AMERICA")
        ],
        searchResults: [Stock] = [
            Stock(currentPrice: 456.90, ticker: "APPL", name: "APPLE"),
            Stock(currentPrice: 12.56, ticker: "NU", name: "NUBANK")
        ]
    ) {
        self.error = error
        self.cacheStock = cacheStock
        self.searchResults = searchResults
    }
    
    func cachedStocks() async -> [Stock] {
        cacheStock
    }
    
    func searchStock(searchText: String) async throws -> [Stock] {
        if let error = error {
            throw error
        }
        return searchText.isEmpty ? await cachedStocks() : searchResults
    }
}
