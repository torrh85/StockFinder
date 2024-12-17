//
//  StocksSearchViewModel.swift
//  StocksSearch
//
//  Created by HAWER TORRES on 16/12/24.
//

import Foundation
import Combine

class StocksSearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var stocks = [Stock]()
    @Published var networkError: NetworkError?
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    private var repository: SearchStocksRepository
    
    init(repository: SearchStocksRepository = SearchStocksAPIRepository.default) {
        self.repository = repository
    }
    
    func setupSearchTextListener() {
        $searchText
            .dropFirst()
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { query in
                self.isLoading = true
                Task {
                    await self.search(query: query)
                }
            }
            .store(in: &cancellables)
    }
    
    func getCacheStocks() {
        Task {
            let results = await repository.cachedStocks()
            await MainActor.run {
                stocks = results
            }
        }
    }
    
    func search(query: String) async {
        do {
            let result  = try await repository.searchStock(searchText: query)
            await MainActor.run {
                stocks = result
                isLoading = false
            }
        } catch {
            await MainActor.run {
                isLoading = false
                if let customError = error as? NetworkError {
                    networkError = customError
                } else {
                    networkError = .unknown
                }
            }
        }
    }
}
