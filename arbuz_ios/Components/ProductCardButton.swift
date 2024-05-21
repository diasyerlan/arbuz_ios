//
//  ProductCardButton.swift
//  arbuz_ios
//
//  Created by Dias Yerlan on 21.05.2024.
//

import SwiftUI

struct ProductCardButton: View {
    @EnvironmentObject var cartData: CartViewModel
    @EnvironmentObject var homeData: HomeViewModel
    @Binding var product: Product
    var body: some View {
        Button(action: {
            product.count += 1
            if(cartData.products.contains(product)) {
                cartData.removeFromCart(product: product)
            }
            cartData.addToCart(product: product)
            
        }) {
            if(product.count <= 0) {
                HStack (spacing: 30){
                    Text("\(product.price) ₸").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Image(systemName: "plus")
                        .foregroundColor(.green)
                        .font(.system(size: 20, weight: .bold))
                }}
            else {
                HStack (spacing: 15){
                    Button(action: {
                        if product.count == 1 {
                            cartData.removeFromCart(product: product)
                            product.count -= 1

                        } else {
                            cartData.removeFromCart(product: product)
                            product.count -= 1
                            cartData.addToCart(product: product)
                    }
                        


                    })
                    {
                        Image(systemName: "minus")
                            .font(.system(size: 20, weight: .bold))
                    }
                    Text("\(product.count)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Button(action: {
                        product.count += 1
                        if(cartData.products.contains(product)) {
                            cartData.removeFromCart(product: product)
                        }
                        cartData.addToCart(product: product)
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .bold))
                            
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .background(product.count <= 0 ? Color.black.opacity(0.08) : .green)
        .foregroundColor(product.count <= 0 ? .black : .white)
        .cornerRadius(16)
    }
}

