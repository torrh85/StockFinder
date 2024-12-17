//
//  StockSearchRow.swift
//  StocksSearch
//
//  Created by HAWER TORRES on 16/12/24.
//

import SwiftUI

struct StockSearchRow: View {
    let stock: Stock
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(stock.ticker)
                    .font(.headline)
                Text(stock.name)
                    .font(.caption)
            }
            Spacer()
            Text(stock.currentPrice.asCurrency)
                .font(.headline)
        }
        .padding()

    }
}

#Preview {
    StockSearchRow(stock: Stock(currentPrice: 234.98, ticker: "AAPL", name: "APPLE"))
}
