//
//  Resource.swift
//  StocksSearch
//
//  Created by HAWER TORRES on 16/12/24.
//

import Foundation

struct Resource<T> {
    var parse: (Data) throws -> (T)
    let endpoint: Endpoint
}

extension Resource where T: Codable {
    init(_ endpoint: Endpoint) {
        self.endpoint = endpoint
        self.parse = { data in
            try JSONDecoder().decode(T.self, from: data)
        }
    }
}

enum Endpoint {
    case search
    
    var url: URL? {
        switch self {
            case .search:
                return URL(string: "https://gist.githubusercontent.com/priyanshrastogi/0e1d4f8d517698cfdced49f5e59567be/raw/9158ad254e92aaffe215e950f4846a23a0680703/mock-stocks.json")
        }
    }
}
