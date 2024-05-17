//
//  CardView.swift
//  arbuz
//
//  Created by Dias Yerlan on 16.05.2024.
//

import SwiftUI

struct CardView: View {
    
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
                
                Button(action: {}) {
                    HStack (spacing: 30){
                        Text("$\(product.price)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                            .font(.system(size: 20, weight: .bold))
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(Color.black.opacity(0.08))
                .foregroundColor(.black)
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

    }
}

#Preview {
    Home()
}
