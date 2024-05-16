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
}

var products = [
    Product(title: "Pizza", price: 10, image: "pizza", description: "Delicious Italian pizza"),
    Product(title: "Burger", price: 8, image: "burger", description: "Classic beef burger with cheese"),
    Product(title: "Salad", price: 6, image: "salad", description: "Fresh garden salad with veggies"),
    Product(title: "Sushi", price: 15, image: "sushi", description: "Assorted sushi rolls with fish and rice"),
    Product(title: "Pasta", price: 12, image: "pasta", description: "Spaghetti pasta with tomato sauce")
]

var groceryProducts = [
    Product(title: "Apples", price: 2, image: "apples", description: "Crisp and juicy apples"),
    Product(title: "Milk", price: 3, image: "milk", description: "Fresh dairy milk"),
    Product(title: "Bread", price: 2, image: "bread", description: "Soft and fluffy bread loaf"),
    Product(title: "Eggs", price: 2, image: "eggs", description: "Farm-fresh eggs")
]
