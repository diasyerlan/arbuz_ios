//
//  CartViewModel.swift
//  arbuz
//
//  Created by Dias Yerlan on 17.05.2024.
//

import Foundation
class CartViewModel: ObservableObject {
    @Published var products: [Product] = [] {
        didSet {
            updateTotal()
        }
    }
    @Published var total: Int = 0
    @Published var isLoading = false
    
    
    func addToCart (product: Product) {
        products.append(product)
    }
    
    func removeFromCart(product: Product) {
        products = products.filter{$0.id != product.id}
    }
    private func updateTotal() {
        total = products.reduce(0) { $0 + $1.price * $1.count }
    }
    
}
