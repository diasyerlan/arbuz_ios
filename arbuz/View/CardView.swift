//
//  CardView.swift
//  arbuz
//
//  Created by Dias Yerlan on 16.05.2024.
//

import SwiftUI

struct CardView: View {
    @StateObject var cartData = CartViewModel()
    @StateObject var homeData = HomeViewModel()
    var isForHeader: Bool
    var size: CGFloat
    @Binding var product: Product
    var body: some View {
        HStack {
            VStack {
                if !isForHeader { Image(product.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size, height: size)
                                    .cornerRadius(10)
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
                
                Button(action: {
                    cartData.addToCart(product: product)
                    product.count += 1
                }) {
                    if(product.count <= 0) {
                        HStack (spacing: 30){
                            Text("$\(product.price)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Image(systemName: "plus")
                                .foregroundColor(.green)
                                .font(.system(size: 20, weight: .bold))
                        }}
                    else {
                        HStack (spacing: 15){
                            Button(action: {
                                product.count -= 1

                            })
                            {
                                Image(systemName: "minus")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            Text("\(product.count)")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Button(action: {
                                product.count += 1

                            }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 20, weight: .bold))
                                    
                            }
                        }
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(product.count <= 0 ? .black.opacity(0.08) : .green)
                .foregroundColor(product.count <= 0 ? .black : .white)
                .cornerRadius(16)
                
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
        
}
    

#Preview {
   
    
    HomeView()
}
