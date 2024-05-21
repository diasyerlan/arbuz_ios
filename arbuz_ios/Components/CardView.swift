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
                            homeData.selectedProduct = product
                            homeData.showingBottomSheet.toggle()
                        }
                        .sheet(isPresented: $homeData.showingBottomSheet, content: {
                            if #available(iOS 16.0, *) {
                                ZStack {
                                    ProductDetailsView(product: $homeData.selectedProduct)
                                        .presentationDetents([.medium])
                                        .cornerRadius(10)
                                        .onAppear {
                                            startFakeNetworkCall()
                                        }
                                        .onDisappear{
                                            if let index = homeData.scrollProducts.firstIndex(where: { $0.id == homeData.selectedProduct.id }) {
                                                homeData.scrollProducts[index] = homeData.selectedProduct
                                            }
                                            if(homeData.product.id == homeData.selectedProduct.id) {
                                                homeData.product = homeData.selectedProduct
                                            }
                                            if let index = homeData.gridProducts.firstIndex(where: { $0.id == homeData.selectedProduct.id }) {
                                                homeData.gridProducts[index] = homeData.selectedProduct
                                            }
                                        }
                                    if cartData.isLoading {
                                        LoadingView(isForCard: true)
                                    }
                                }
                            }
                        })
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
    }
    func startFakeNetworkCall() {
        cartData.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            cartData.isLoading = false
        }
    }
    
}


