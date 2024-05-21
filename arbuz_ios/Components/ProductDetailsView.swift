//
//  ProductDetailsView.swift
//  arbuz_ios
//
//  Created by Dias Yerlan on 21.05.2024.
//

import SwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject var cartData: CartViewModel
    @EnvironmentObject var homeData: HomeViewModel
    @Binding var product: Product
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .frame(height: 250)
            HStack {
                Text(product.title)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                ProductCardButton(product: $product)
            }.padding(.horizontal)
            Spacer()
            Text(product.description)
                .font(.title2)
            
            Spacer()
        }.environmentObject(cartData)
        .environmentObject(homeData)
    }
}

