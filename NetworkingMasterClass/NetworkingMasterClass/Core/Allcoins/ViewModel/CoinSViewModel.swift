//
//  CoinSViewModel.swift
//  NetworkingMasterClass
//
//  Created by goboitumelo,mpuru on 2024/03/20.
//

import Foundation

class CoinSViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var errorMessage: String?
   
    
    private let service = CoinDataServices()
    
    init() {
        //fetchPrice(coin: "bitcoin")
        fetchCoin()
    }
    
    func fetchCoin(){
        
        // we use this when we use the optional values
//        service.fetchCoins { coins, error in
//            DispatchQueue.main.async{
//                if let error = error {
//                    self.errorMessage = error.localizedDescription
//                    return
//                }
//                self.coin = coins ?? []
//            }
//        }
        
        service.fetchCoinsWithResults{ Result in
            DispatchQueue.main.async{
                switch Result {
                case .success(let coins):
                    self.coins = coins
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
