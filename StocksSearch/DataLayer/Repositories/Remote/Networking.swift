//
//  Networking.swift
//  StocksSearch
//
//  Created by HAWER TORRES on 16/12/24.
//

import Foundation

protocol Networking {
    func fetch<T: Codable>(resource: Resource<T>) async throws -> T
}

class NetworkProvider: Networking {
    func fetch<T: Codable>(resource: Resource<T>) async throws -> T {
        guard let url = resource.endpoint.url else { throw NetworkError.invalidEndpoint }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        return try resource.parse(data)
    }
}
