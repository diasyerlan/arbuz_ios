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
                        ScrollView {
                            CartViewControllerRepresentable(cartProducts: cartData.products)
                        }
                        .environmentObject(cartData)
                        HStack {
                            Text("Total: ")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Text("\(cartData.total) ₸")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
                    if(cartData.total > 0 && cartData.total <= 8000) {
                        showToast = true
                    }
                }
                if cartData.isLoading {
                    LoadingView()
                }
            }
        }
        .simpleToast(isPresented: $showToast, options: toastOptions) {
            HStack{
                Image(systemName: "checkmark.circle")
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

#Preview {
    ContentView()
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Spacer()
                .background(Color.black.opacity(0.1))
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .scaleEffect(3)
        }
    }
}
