//
//  CoinSViewModel.swift
//  NetworkingMasterClass
//
//  Created by goboitumelo,mpuru on 2024/03/20.
//

import Foundation

class CoinSViewModel: ObservableObject {
    
    @Published var coin = ""
    @Published var price = ""
    @Published var errorMesaage: String?
    
    private let service = CoinDataServices()
    
    init() {
        //fetchPrice(coin: "bitcoin")
        fetchCoin()
    }
    
    func fetchCoin(){
        service.fetchCoins()
    }
    
    func fetchPrice(coin: String) {
        service.fetchPrice(coin: coin) { priceFromService in
            DispatchQueue.main.async{
                self.price = "R\(priceFromService)"
                self.coin = coin
            }
        }
    }
    
}
