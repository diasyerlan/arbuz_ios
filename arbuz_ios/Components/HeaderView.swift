//
//  HeaderView.swift
//  arbuz
//
//  Created by Dias Yerlan on 16.05.2024.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var homeData: HomeViewModel
    @EnvironmentObject var cartData: CartViewModel
    @Binding var product: Product
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Spacer(minLength: 20)
                    CardView(isForHeader: true, size: 0, product: $product)
                    Divider()
                    
                }
                .opacity(homeData.offset > 200 ? 1 - (homeData.offset - 200) / 50.0 : 1)
                VStack {
                    Text("Fast. Beautiful. Delicious.")
                        .font(.title)
                        .fontWeight(.bold)
                    Divider()
                }
                .opacity(homeData.offset > 200 ? (homeData.offset - 200) / 50.0 : 0)
                
                
            }
            
            
            
            
        }.padding(.horizontal)
            .frame(height: 50)
            .background(Color.white)
            .environmentObject(cartData)
            .environmentObject(homeData)
    }
}
