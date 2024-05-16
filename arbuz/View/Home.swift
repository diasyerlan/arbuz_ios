//
//  Home.swift
//  arbuz
//
//  Created by Dias Yerlan on 15.05.2024.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 15,pinnedViews: [.sectionHeaders], content: {
                
                GeometryReader { reader -> AnyView in
                    let offset = reader.frame(in: .global).minY
                    
                    if -offset >= 0 {
                        DispatchQueue.main.async {
                            self.homeData.offset = -offset
                        }
                    }
                    return AnyView (
                        
                        Image(homeData.product!.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0)).cornerRadius(2).offset(y: (offset > 0 ? -offset : 0))
                            
                    )
                    
                }.frame(height: 250)
                
                Section(header: HeaderView(product: $homeData.product)) {
                    CustomTitle(title: "Special Offer")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(products) { product in
                                CardView(size: 130, product: product)
                            }
                        }
                    }.padding()
                    
                    Divider().padding(.top)
                    CustomTitle(title: "More")

                    LazyVGrid(columns: homeData.columns, spacing: 20, content: {
                        ForEach(groceryProducts) { product in
                            CardView(size: 160, product: product)
                        }
                    })
                        
                }
            })
                
            
        }
        .overlay(
            Color.white
                .frame(height: UIApplication.shared.connectedScenes
                            .compactMap { $0 as? UIWindowScene }
                            .first?.windows.first?.safeAreaInsets.top ?? 0)
                .ignoresSafeArea(.all, edges: .top).opacity(homeData.offset > 250 ? 1: 0),
            alignment: .top)
        .environmentObject(homeData)

    }
}

struct CustomTitle: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.leading)
    }
}

#Preview {
    Home()
}
