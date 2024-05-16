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
            
            HStack {
                HeaderCardView(product: product!)
            }
            if homeData.offset > 250 {
                Divider()
            }
        }.padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
    }
}

#Preview {
    Home()
}
