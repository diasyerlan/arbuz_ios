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
    var count: Int
}

var headerProducts = [
    Product(title: "Bananas", price: 2, image: "bananas", description: "Fresh and ripe bananas", isFavorite: false, count: 0),
    Product(title: "Spinach", price: 3, image: "spinach", description: "Nutrient-rich spinach leaves", isFavorite: false, count: 0),
    Product(title: "Chicken", price: 6, image: "chicken", description: "Lean chicken breast fillets", isFavorite: false, count: 0),
    Product(title: "Grain Bread", price: 4, image: "black_bread", description: "Nutritious whole grain bread", isFavorite: false, count: 0)
]
var products = [
    Product(title: "Pizza", price: 10, image: "pizza", description: "Delicious Italian pizza", isFavorite: false, count: 0),
    Product(title: "Burger", price: 8, image: "burger", description: "Classic beef burger with cheese", isFavorite: false, count: 0),
    Product(title: "Salad", price: 6, image: "salad", description: "Fresh garden salad with veggies", isFavorite: false, count: 0),
    Product(title: "Sushi", price: 15, image: "sushi", description: "Assorted sushi rolls with fish and rice", isFavorite: false, count: 0),
    Product(title: "Pasta", price: 12, image: "pasta", description: "Spaghetti pasta with tomato sauce", isFavorite: false, count: 0)
]


var groceryProducts = [
    Product(title: "Apples", price: 2, image: "apples", description: "Crisp and juicy apples", isFavorite: false, count: 0),
    Product(title: "Milk", price: 3, image: "milk", description: "Fresh dairy milk", isFavorite: false, count: 0),
    Product(title: "Bread", price: 2, image: "bread", description: "Soft and fluffy bread loaf", isFavorite: false, count: 0),
    Product(title: "Eggs", price: 2, image: "eggs", description: "Farm-fresh eggs", isFavorite: false, count: 0)
]
