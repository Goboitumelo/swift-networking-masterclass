//
//  CoinSViewModel.swift
//  NetworkingMasterClass
//
//  Created by goboitumelo,mpuru on 2024/03/20.
//

import Foundation

class CoinSViewModel: ObservableObject {
    
    @Published var coin = [Coin]()
   
    
    private let service = CoinDataServices()
    
    init() {
        //fetchPrice(coin: "bitcoin")
        fetchCoin()
    }
    
    func fetchCoin(){
        service.fetchCoins { coins in
            DispatchQueue.main.async{
                self.coin = coins
            }
        }
    }
}
