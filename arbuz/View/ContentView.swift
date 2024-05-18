//
//  ContentView.swift
//  arbuz
//
//  Created by Dias Yerlan on 15.05.2024.
//

import SwiftUI

struct ContentView: View {

        @State private var selectedTab: Tab = .house
  
    
        var body: some View {
            VStack {
                switch selectedTab {
                case .house:
                    HomeView()
                case .cart:
                    CartView()
                }
                Spacer()
                TabBarView(selectedTab: $selectedTab)
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    
}

#Preview {
    ContentView()
}
