//
//  CacheManagerTests.swift
//  StocksSearchTests
//
//  Created by HAWER TORRES on 16/12/24.
//

import XCTest
@testable import StocksSearch

final class CacheManagerTests: XCTestCase {
    func testConcurrentAccess() async throws {
        // Given
        let mock = StockDataStoreMock()
        let cacheManager = CacheManager(localData: mock)
        
        let stock1 = [
            Stock(currentPrice: 500.0, ticker: "NVDA", name: "NVIDIA"),
            Stock(currentPrice: 1340.0, ticker: "MEL", name: "MELI"),
        ]
        
        let stock2 = [
            Stock(currentPrice: 40.0, ticker: "BAC", name: "BANK OF AMERICA"),
            Stock(currentPrice: 340.0, ticker: "ORCL", name: "ORACLE"),
        ]
        
        // When
        let task1 = Task {
            await cacheManager.cacheStocks(stock1)
        }
        
        let task2 = Task {
            await cacheManager.cacheStocks(stock2)
        }
        
        let task3 = Task {
            await cacheManager.getStock(for: "BAC")
        }
        
        await task1.value
        await task2.value
        let result = await task3.value
        
        
        // then
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.ticker.uppercased(), "BAC")
        
        let allStocks = await cacheManager.getAllStocks()
        XCTAssertEqual(allStocks.count, 4)
    }
}
