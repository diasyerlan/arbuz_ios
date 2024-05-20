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
    @Published var headProducts = headerProducts
    @Published var scrollProducts = products
    @Published var gridProducts = groceryProducts
    
    func fetchData() {
        product = headerProducts.randomElement()!
        headProducts = headerProducts
        scrollProducts = products
        gridProducts = groceryProducts
        }
}
