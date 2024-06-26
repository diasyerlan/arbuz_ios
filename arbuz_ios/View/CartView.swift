//
//  CartView.swift
//  arbuz
//
//  Created by Dias Yerlan on 18.05.2024.
//

import SwiftUI
import SimpleToast

struct CartView: View {
    @State private var shouldNavigate = false;
    @State private var showToast = false
    private let toastOptions = SimpleToastOptions(
        alignment: .top,
        hideAfter: 2,
        animation: .default,
        modifierType: .slide
    )
    @EnvironmentObject var cartData: CartViewModel
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if(cartData.products.count > 0) {
                        CartHeaderView()
                        Spacer(minLength: 5)
                        GeometryReader { geometry in
                            ScrollView(.vertical) {
                                CartViewControllerRepresentable()
                                    .environmentObject(cartData)
                                    .frame(width: geometry.size.width, height: geometry.size.height*3/2)
                            }
                        }
                        .environmentObject(cartData)
                        HStack {
                            Text("Total: ")
                                .font(.title)
                            Text("\(cartData.total) ₸")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                            Button(action: {
                                startFakeNetworkCall()
                            }, label: {
                                Text("Checkout").bold()
                                NavigationLink(destination: CheckoutView(), isActive:$shouldNavigate) {
                                }
                                .hidden()
                                
                            })
                            .padding(10)
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(15)
                        }
                        .padding()
                    } else {
                        VStack {
                            Spacer()
                            Text("Your cart is empty :/")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                        }
                    }
                    
                }
                .onAppear{
                    if(cartData.total > 0 && cartData.total < 8000) {
                        showToast = true
                    }
                }
                if cartData.isLoading {
                    LoadingView(isForCard: false)
                }
            }
        }
        .simpleToast(isPresented: $showToast, options: toastOptions) {
            HStack{
                Image(systemName: "car.side.fill")
                Text( "\(8000-cartData.total) ₸ left until free delivery").bold()
            }
            .padding(20)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(14)
            
        }
    }
    func startFakeNetworkCall() {
        cartData.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            cartData.isLoading = false
            shouldNavigate = true
            
        }
    }
}

struct CartHeaderView: View {
    var body: some View {
        Text("My Cart")
            .font(.title)
            .fontWeight(.bold)
    }
}

