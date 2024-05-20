//
//  ContentView.swift
//  arbuz
//
//  Created by Dias Yerlan on 15.05.2024.
//

import SwiftUI

struct ContentView: View {

    @State private var selectedTab: Tab = .house
    @StateObject var cartData = CartViewModel()
    @StateObject var homeData = HomeViewModel()
  
        var body: some View {
            VStack {
                switch selectedTab {
                case .house:
                    HomeView()
                        .onAppear(
                            perform: {
                                homeData.fetchData()
                                cartData.products = []
                            }
                        )
                case .cart:
                    CartView()
                }
                TabBarView(selectedTab: $selectedTab)
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .environmentObject(cartData)
            .environmentObject(homeData)
        }
    
}

#Preview {
    ContentView()
}
