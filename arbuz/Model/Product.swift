//
//  Product.swift
//  arbuz
//
//  Created by Dias Yerlan on 15.05.2024.
//

import SwiftUI

struct Product {
    var id = UUID().uuidString
    var title: String
    var price: Int
    var image: String
}

var products = [
    Product(title: "Pizza", price: 10, image: "pizza_image"),
    Product(title: "Burger", price: 8, image: "burger_image"),
    Product(title: "Salad", price: 6, image: "salad_image"),
    Product(title: "Sushi", price: 15, image: "sushi_image"),
    Product(title: "Pasta", price: 12, image: "pasta_image")
]

var groceryProducts = [
    Product(title: "Apples", price: 2, image: "apples_image"),
    Product(title: "Milk", price: 3, image: "milk_image"),
    Product(title: "Bread", price: 2, image: "bread_image"),
    Product(title: "Eggs", price: 2, image: "eggs_image")
]
