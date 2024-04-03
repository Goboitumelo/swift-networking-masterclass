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
            ForEach(viewModel.coin) { Coin in
                Text(Coin.name)
                
            }
        }
        
    }
    
    
    struct ContentView_Previews : PreviewProvider{
        static var previews: some View{
            ContentView()
        }
    }
    
}
