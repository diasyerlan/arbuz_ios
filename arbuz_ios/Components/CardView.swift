//
//  CardView.swift
//  arbuz
//
//  Created by Dias Yerlan on 16.05.2024.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var cartData: CartViewModel
    @EnvironmentObject var homeData: HomeViewModel
    var isForHeader: Bool
    var size: CGFloat
    @Binding var product: Product
    var body: some View {
        HStack {
            VStack {
                if !isForHeader { 
                    Image(product.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size, height: size)
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        homeData.showingBottomSheet.toggle()
                                    }
                            }
                Spacer(minLength: 5)
                HStack {
                    Text(product.title)
                        .font(.system(size: 20))
                    Button(action: {
                        product.isFavorite.toggle()
                    }) {
                        Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                            .font(.system(size: 20))
                            .foregroundColor(product.isFavorite ? Color.red : Color.black)
                    }
                    
                    
                }
                
               ProductCardButton(product: $product)
            }
            if isForHeader { Spacer()
                Text(product.description)
                    .font(.title3)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.horizontal)
        .environmentObject(cartData)
        .environmentObject(homeData)
        .sheet(isPresented: $homeData.showingBottomSheet, content: {
            if #available(iOS 16.0, *) {
                ProductDetailsView(product: $product)
                    .presentationDetents([.medium])
                    .cornerRadius(10)
            } else {
                ProductDetailsView(product: $product)
                }
        })

    }
        
}
    

