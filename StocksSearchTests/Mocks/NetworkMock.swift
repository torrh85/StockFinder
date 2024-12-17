//
//  NetworkMock.swift
//  StocksSearchTests
//
//  Created by HAWER TORRES on 16/12/24.
//

import Foundation
@testable import StocksSearch

class NetworkMock: Networking {
    func fetch<T: Codable>(resource: Resource<T>) async throws -> T {
        guard let url = Bundle(for: type(of: self)).url(forResource: "stocks", withExtension: "json") else {
            throw NetworkError.invalidEndpoint
        }

        let data = try Data(contentsOf: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}
