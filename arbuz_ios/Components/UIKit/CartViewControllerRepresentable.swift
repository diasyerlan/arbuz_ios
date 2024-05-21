//
//  CartViewControllerRepresentable.swift
//  arbuz
//
//  Created by Dias Yerlan on 19.05.2024.
//

import SwiftUI

struct CartViewControllerRepresentable: UIViewControllerRepresentable {
    @EnvironmentObject var cartData: CartViewModel
    
    func makeUIViewController(context: Context) -> CartViewController {
        let viewController = CartViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: CartViewController, context: Context) {
        uiViewController.updateCartProducts(cartData.products)
    }
}
