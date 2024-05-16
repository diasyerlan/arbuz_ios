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
}

var products = [
    Product(title: "Pizza", price: 10, image: "pizza"),
    Product(title: "Burger", price: 8, image: "burger"),
    Product(title: "Salad", price: 6, image: "salad"),
    Product(title: "Sushi", price: 15, image: "sushi"),
    Product(title: "Pasta", price: 12, image: "pasta")
]

var groceryProducts = [
    Product(title: "Apples", price: 2, image: "apples"),
    Product(title: "Milk", price: 3, image: "milk"),
    Product(title: "Bread", price: 2, image: "bread"),
    Product(title: "Eggs", price: 2, image: "eggs")
]
