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
                Spacer(minLength: 0)
                Divider()
                Spacer(minLength: 0)
                TabBarView(selectedTab: $selectedTab).background(
                    cartData.isLoading ? Color.black.opacity(0.1) : Color.white
                )
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .environmentObject(cartData)
            .environmentObject(homeData)
        }
    
}

#Preview {
    ContentView()
}
