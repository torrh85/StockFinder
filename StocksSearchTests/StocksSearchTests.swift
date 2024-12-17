//
//  StocksSearchTests.swift
//  StocksSearchTests
//
//  Created by HAWER TORRES on 16/12/24.
//

import XCTest
@testable import StocksSearch

final class StocksSearchTests: XCTestCase {
    func testSearchEmptyQuery() async {
        // Given
        let repository: SearchStocksRepository = SearchRepositoryMock()
        let viewModel = StocksSearchViewModel(repository: repository)
        
        // When
        await viewModel.search(query: "")
        
        // Then
        XCTAssertTrue(viewModel.stocks.count == 3)
    }
    
    func testErrorHandling() async {
        // Given
        let repository: SearchStocksRepository = SearchRepositoryMock(error: .invalidResponse)
        let viewModel = StocksSearchViewModel(repository: repository)
        
        // When
        await viewModel.search(query: "")
        
        // Then
        XCTAssertNotEqual(viewModel.networkError?.description, NetworkError.invalidEndpoint.description)
        XCTAssertEqual(viewModel.networkError?.description, NetworkError.invalidResponse.description)
    }
    
    func testSearchValidQuery() async throws {
        // Given
        let repository: SearchStocksRepository = SearchStocksAPIRepository(network: NetworkMock())
        let viewModel = StocksSearchViewModel(repository: repository)
        
        // When
        await viewModel.search(query: "ULUG")
        
        // Then
        XCTAssertTrue(viewModel.stocks.count == 1)
    }
    
    func testSearchInvalidQuery() async throws {
        // Given
        let repository: SearchStocksRepository = SearchStocksAPIRepository(network: NetworkMock())
        let viewModel = StocksSearchViewModel(repository: repository)
        
        // When
        await viewModel.search(query: "KO")
        
        // Then
        XCTAssertTrue(viewModel.stocks.isEmpty)
    }
}
