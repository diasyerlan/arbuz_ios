//
//  CartView.swift
//  arbuz
//
//  Created by Dias Yerlan on 18.05.2024.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartData: CartViewModel
    var body: some View {
        
            if(cartData.products.count > 0) {
                CartHeaderView()
                ScrollView {
                    CartViewControllerRepresentable(cartProducts: cartData.products)
                        
                }
                .environmentObject(cartData)
                HStack {
                    Text("Total: ")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("\(cartData.total) ₸")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding()
            } else {
                VStack {
                    Spacer()
                    Text("Your cart is empty :/")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
            }
        
        
    }
}

struct CartHeaderView: View {
    var body: some View {
            Text("My Cart")
                .font(.title)
                .fontWeight(.bold)
    }
}

#Preview {
    ContentView()
}
