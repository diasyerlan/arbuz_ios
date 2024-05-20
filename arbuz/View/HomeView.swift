//
//  Home.swift
//  arbuz
//
//  Created by Dias Yerlan on 15.05.2024.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var homeData: HomeViewModel
    @EnvironmentObject var cartData: CartViewModel
    
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
                            
                            Image(homeData.product.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0)).cornerRadius(15).offset(y: (offset > 0 ? -offset : 0))
                            
                        )
                        
                    }.frame(height: 250)
                    
                    Section(header: HeaderView(product: $homeData.product)) {
                        Spacer(minLength: 10)
                        CustomTitle(title: "Special Offer")
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach($homeData.scrollProducts) { product in
                                    CardView(isForHeader: false, size: 130, product: product)
                                    
                                }
                            }
                        }.padding()
                        
                        Divider().padding(.top)
                        CustomTitle(title: "More")
                        
                        LazyVGrid(columns: homeData.columns, spacing: 10, content: {
                            ForEach($homeData.gridProducts) { product in
                                CardView(isForHeader: false, size: 170, product: product)
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
            .environmentObject(cartData)


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
    ContentView()
}
