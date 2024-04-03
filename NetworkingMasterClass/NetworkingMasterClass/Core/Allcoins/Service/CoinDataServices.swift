//
//  coinDataServices.swift
//  NetworkingMasterClass
//
//  Created by goboitumelo,mpuru on 2024/03/27.
//

import Foundation

class CoinDataServices{
    
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=zar&order=market_cap_desc&per_page=10&sparkline=false&price_change_percentage=24h&locale=en"
    
    // Mark: Async function
    
    func fecthcoins() async throws -> [Coin]{
        guard let url = URL(string: urlString) else {return []}
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let coins = try JSONDecoder().decode([Coin].self, from: data)
            return coins
        }catch{
            print("DEBUG: our data is \(error.localizedDescription)")
            return []
        }
        
    }

}

//Mark: completion handler stuff

extension CoinDataServices {
    func fetchCoinsWithResults(completion: @escaping(Result<[Coin], CoinAPIError>) -> Void ){
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url){data, response, error in
            if let error = error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else{
                completion(.failure(.requestFailled(description: "Request failed")))
                return
            }
            
            guard httpResponse.statusCode == 200 else{
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                completion(.success(coins))
            }catch{
                print("DEBUG: Failed to decode with \(error)")
                completion(.failure(.jsonParsingFailure))
            }
        }.resume()
    }
    
    func fetchPrice(coin: String, completion: @escaping(Double) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=zar"
        guard let url = URL(string: urlString) else {return}
        
        //completion handler it takes time as it waits for the response before it runs
        URLSession.shared.dataTask(with: url){data, response, error in
            if let error = error {
                print("DEBUG: Failed with error\(error.localizedDescription)")
                //                self.errorMesaage = error.localizedDescription
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else{
                //                self.errorMesaage = "Bad Httpresponse"
                return
            }
            
            guard httpResponse.statusCode == 200 else{
                //                self.errorMesaage = "fail with status code \(httpResponse.statusCode)"
                return
            }
            guard let data = data else {return}
            //cust the object as dictionary "as? [String: Any]"
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {return}
            print("Jsonopject \(jsonObject)")
            // cust the value to dictionary
            guard let value = jsonObject[coin] as? [String: Double] else {return}
            guard let price = value["zar"] else {return}
            
            completion(price)
            
        }.resume()
        
    }
}
