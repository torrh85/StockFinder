//
//  NetworkError.swift
//  StocksSearch
//
//  Created by HAWER TORRES on 16/12/24.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case invalidEndpoint
    case invalidResponse
    case unknown
    
    var description: String {
        switch self {
        case .invalidEndpoint:
            return "The requested endpoint is invalid. Please contact support."
        case .invalidResponse:
            return "The server returned an invalid response. This could be an issue with the server or the data."
        case .unknown:
            return "An unknown error occurred. Please try again later or contact support."
        }
    }
}
