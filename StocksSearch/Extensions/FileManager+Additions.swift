//
//  FileManager+Additions.swift
//  StocksSearch
//
//  Created by HAWER TORRES on 16/12/24.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL? {
        guard let url = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first else {
            return nil
        }
        
        return url
    }
}
