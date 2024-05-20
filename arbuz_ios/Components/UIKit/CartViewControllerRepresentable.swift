//
//  CartViewControllerRepresentable.swift
//  arbuz
//
//  Created by Dias Yerlan on 19.05.2024.
//

import SwiftUI
import UIKit

struct CartViewControllerRepresentable: UIViewControllerRepresentable {
    var cartProducts: [Product]

    func makeUIViewController(context: Context) -> CartViewController {
        let viewController = CartViewController()
        viewController.cartProducts = cartProducts
        return viewController
    }

    func updateUIViewController(_ uiViewController: CartViewController, context: Context) {
        uiViewController.cartProducts = cartProducts
        uiViewController.collectionView.reloadData()
    }
}
