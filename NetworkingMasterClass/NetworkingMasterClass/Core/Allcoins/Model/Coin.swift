//
//  Coin.swift
//  NetworkingMasterClass
//
//  Created by goboitumelo,mpuru on 2024/03/27.
//

import Foundation

struct Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let current_price: Double
    let market_cap_rank: Int
    
    
    //decoding 
//    enum CodinKeys: String, CodingKey {
//        case id, symbol, name
//        case currentPrice = "current_Price"
//        case marketCapRank = "market_cap_rank"
//    }
    
}
