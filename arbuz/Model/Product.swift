//
//  Product.swift
//  arbuz
//
//  Created by Dias Yerlan on 15.05.2024.
//

import SwiftUI

struct Product: Identifiable{
    var id = UUID().uuidString
    var title: String
    var price: Int
    var image: String
    var description: String
    var isFavorite: Bool
}

var headerProducts = [
    Product(title: "Bananas", price: 2, image: "bananas", description: "Fresh and ripe bananas", isFavorite: false),
    Product(title: "Spinach", price: 3, image: "spinach", description: "Nutrient-rich spinach leaves", isFavorite: false),
    Product(title: "Chicken", price: 6, image: "chicken", description: "Lean chicken breast fillets", isFavorite: false),
    Product(title: "Grain Bread", price: 4, image: "black_bread", description: "Nutritious whole grain bread", isFavorite: false)
]
