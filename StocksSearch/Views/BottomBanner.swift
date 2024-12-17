//
//  BottomBanner.swift
//  StocksSearch
//
//  Created by HAWER TORRES on 16/12/24.
//

import SwiftUI

struct ErrorBanner: View {
    let message: String
    
    var body: some View {
        Text(message)
            .font(.headline)
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.red)
            .cornerRadius(10)
            .padding(.horizontal)
    }
}
