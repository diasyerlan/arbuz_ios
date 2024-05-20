//
//  ProductCardView.swift
//  arbuz
//
//  Created by Dias Yerlan on 18.05.2024.
//

import SwiftUI

struct ProductCartView: View {
    @EnvironmentObject var cartData: CartViewModel
    @Binding var product: Product
    var body: some View {
        HStack{
            HStack (spacing: 20){
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                
                VStack {
                    Text(product.title)
                    Button(action: {}) {
                        HStack{
                            Button(action: {
                                if (product.count == 0) {
                                    cartData.removeFromCart(product: product)
                                } else {product.count -= 1
                                    print(cartData.products)
}
                                
                            })
                            {
                                Image(systemName: product.count > 0 ? "minus" : "trash")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            Spacer()

                            Text("\(product.count)")
                                .fontWeight(.bold)
                            Spacer()

                            Button(action: {
                                product.count += 1
                                print(cartData.products)
                                
                            }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 20, weight: .bold))
                                
                            }
                        }
                        
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                        .background(Color.black.opacity(0.08))
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .frame(width: 120)
                    }
                }
            }
            Spacer()
                    Text("$\(product.price * product.count)")
                
            
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(12)
        .frame(width: .infinity)
        .padding()
        .environmentObject(cartData)
    }
}

#Preview {
    ContentView()
}
