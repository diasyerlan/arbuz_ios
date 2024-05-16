//
//  Home.swift
//  arbuz
//
//  Created by Dias Yerlan on 15.05.2024.
//

import SwiftUI

struct Home: View {
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 15,pinnedViews: [.sectionHeaders], content: {
                Section(header: HeaderView()) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(products) { product in
                                CardView(product: product)
                            }
                        }
                    }.padding()
                        
                }
            })
            Spacer(minLength: 50)
            LazyVGrid(columns: columns, spacing: 20, content: {
                ForEach(groceryProducts) { product in
                    CardView(product: product)
                }
            })
            
        }
    }
}

#Preview {
    Home()
}
