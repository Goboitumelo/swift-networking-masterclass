//
//  CoinAPIError.swift
//  NetworkingMasterClass
//
//  Created by goboitumelo,mpuru on 2024/04/03.
//

import Foundation

enum CoinAPIError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailled(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData: return "invalid data"
        case .jsonParsingFailure: return "failed to perse json"
        case let .requestFailled(description): return "Request failed: \(description)"
        case let .invalidStatusCode(statusCode): return "Invalid status Code : \(statusCode)"
        case let .unknownError(error): return "An unknown error occured: \(error.localizedDescription)"
        }
    }
}
