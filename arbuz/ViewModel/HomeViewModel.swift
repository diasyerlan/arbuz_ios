//
//  HomeViewModel.swift
//  arbuz
//
//  Created by Dias Yerlan on 16.05.2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var offset: CGFloat = 0
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @Published var product = headerProducts.randomElement()!
   
    var products = [
        Product(title: "Pizza", price: 10, image: "pizza", description: "Delicious Italian pizza", isFavorite: false),
        Product(title: "Burger", price: 8, image: "burger", description: "Classic beef burger with cheese", isFavorite: false),
        Product(title: "Salad", price: 6, image: "salad", description: "Fresh garden salad with veggies", isFavorite: false),
        Product(title: "Sushi", price: 15, image: "sushi", description: "Assorted sushi rolls with fish and rice", isFavorite: false),
        Product(title: "Pasta", price: 12, image: "pasta", description: "Spaghetti pasta with tomato sauce", isFavorite: false)
    ]


    var groceryProducts = [
        Product(title: "Apples", price: 2, image: "apples", description: "Crisp and juicy apples", isFavorite: false),
        Product(title: "Milk", price: 3, image: "milk", description: "Fresh dairy milk", isFavorite: false),
        Product(title: "Bread", price: 2, image: "bread", description: "Soft and fluffy bread loaf", isFavorite: false),
        Product(title: "Eggs", price: 2, image: "eggs", description: "Farm-fresh eggs", isFavorite: false)
    ]

    

}
