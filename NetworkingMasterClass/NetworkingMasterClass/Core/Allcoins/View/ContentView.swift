//
//  ContentView.swift
//  NetworkingMasterClass
//
//  Created by goboitumelo,mpuru on 2024/03/20.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @StateObject var viewModel = CoinSViewModel()
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        List{
            ForEach(viewModel.coins) { Coin in
                HStack(spacing: 12){
                    Text("\(Coin.market_cap_rank)")
                        .foregroundStyle(.gray)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(Coin.name)
                            .fontWeight(.semibold)
                        
                        Text(Coin.symbol.uppercased())
                    }
                    
                }
                .font(.footnote)
            }
        }
        .overlay{
            if let error = viewModel.errorMessage{
                Text(error)
            }
        }
    }
    
    
    struct ContentView_Previews : PreviewProvider{
        static var previews: some View{
            ContentView()
        }
    }
    
}
