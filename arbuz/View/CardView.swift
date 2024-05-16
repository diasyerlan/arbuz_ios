//
//  CardView.swift
//  arbuz
//
//  Created by Dias Yerlan on 16.05.2024.
//

import SwiftUI

struct CardView: View {
    var size: CGFloat
    var product: Product
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .cornerRadius(10)
            HStack {
                Text(product.title)
                    .font(.system(size: 20))
                Image(systemName: "heart")
                    .font(.system(size: 20))
                                
                
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
    }
}

#Preview {
    Home()
}
