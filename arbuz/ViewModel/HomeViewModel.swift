//
//  HomeViewModel.swift
//  arbuz
//
//  Created by Dias Yerlan on 16.05.2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var offset: CGFloat = 0
    @Published var product = products.randomElement()
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
}
