//
//  StocksDataStore.swift
//  StocksSearch
//
//  Created by HAWER TORRES on 16/12/24.
//

import Foundation

protocol StockDataStore {
    func get() -> [String: Stock]
    func save(data: [String: Stock])
}

struct StockAPIDataStore: StockDataStore {
    private var fileURL: URL? {
        let fileURL = FileManager.documentDirectory?.appendingPathComponent("stocks.json")
        return fileURL
    }
    
    func get() -> [String: Stock] {
        guard let fileURL else { return [:] }
        guard let data = try? Data(contentsOf: fileURL),
              let results = try? JSONDecoder().decode([String: Stock].self, from: data) else { return [:] }
        return results
    }
    
    func save(data: [String: Stock]) {
        guard let jsonData = try? JSONEncoder().encode(data) else {
            return
        }
        
        guard let fileURL else { return }
        
        do {
            try jsonData.write(to: fileURL, options: [])
        } catch {
            print("Failed to write JSON data")
        }
    }
}
