//
//  StocksSearchView.swift
//  StocksSearch
//
//  Created by HAWER TORRES on 16/12/24.
//

import SwiftUI

struct StocksSearchView: View {
    @StateObject var viewModel: StocksSearchViewModel
    
    init() {
        _viewModel = .init(wrappedValue: StocksSearchViewModel())
    }

    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                contentView
                .navigationTitle("Stocks")
            }
            
            if let error = viewModel.networkError {
                ErrorBanner(message: error.description)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .animation(.spring(), value: error)
            }
        }
        .searchable(text: $viewModel.searchText)
        .onAppear {
            viewModel.getCacheStocks()
            viewModel.setupSearchTextListener()
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        if viewModel.showEmptyState {
            VStack {
                Spacer()
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                Text("No stocks found")
                    .font(.title)
                Spacer()
            }
        } else {
            List {
                ForEach(viewModel.stocks) { stock in
                    VStack(alignment: .leading) {
                        StockSearchRow(stock: stock)
                    }
                }
            }
        }
    }
}
