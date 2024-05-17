//
//  HeaderView.swift
//  arbuz
//
//  Created by Dias Yerlan on 16.05.2024.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var homeData: HomeViewModel
    @Binding var product: Product?
    var body: some View {
        VStack {
            ZStack {
                HeaderCardView(product: product!)
                    .opacity(homeData.offset > 200 ? 1 - (homeData.offset - 200) / 50.0 : 1)

                Text("Fast. Beautiful. Delicious.")
                    .opacity(homeData.offset > 200 ? (homeData.offset - 200) / 50.0 : 0)
                    .font(.title)
                    .fontWeight(.bold)
                    
            }
                
            
            if homeData.offset > 250 {
                Divider()
            }
        }.padding(.horizontal)
            .frame(height: 50)
            .background(Color.white)
    }
}

#Preview {
    Home()
}
