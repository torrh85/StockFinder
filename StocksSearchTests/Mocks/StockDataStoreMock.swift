//
//  StockDataStoreMock.swift
//  StocksSearchTests
//
//  Created by HAWER TORRES on 16/12/24.
//

import Foundation
@testable import StocksSearch

class StockDataStoreMock: StockDataStore {
    private var savedData: [String: Stock] = [:]
    
    func save(data: [String: Stock]) {
        savedData = data
    }
    
    func get() -> [String: Stock] {
        savedData
    }
}
