//
//  HeaderCardView.swift
//  arbuz
//
//  Created by Dias Yerlan on 16.05.2024.
//

import SwiftUI

struct HeaderCardView: View {
    var product: Product
    var body: some View {
        HStack {
            VStack {
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
            Spacer()
            Text(product.description)
                .font(.title3)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    Home()
}
