//
//  Stock.swift
//  StocksSearch
//
//  Created by HAWER TORRES on 16/12/24.
//

import Foundation

/// The codable stock data model.
struct Stock: Codable, Identifiable {
    let currentPrice: Double
    let ticker: String
    let name: String
    
    var id: String {
        ticker
    }
}
