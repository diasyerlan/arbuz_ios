//
//  MainTabBarController.swift
//  arbuz_ios
//
//  Created by Dias Yerlan on 20.05.2024.
//

import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewModel = HomeViewModel()
        let cartViewModel = CartViewModel()
        
        let homeView = HomeView()
            .environmentObject(homeViewModel)
            .environmentObject(cartViewModel)
        let cartView = CartView()
            .environmentObject(homeViewModel)
            .environmentObject(cartViewModel)
        
        let homeVC = UIHostingController(rootView: homeView)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let cartVC = UIHostingController(rootView: cartView)
        cartVC.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 1)
        
        tabBar.tintColor = .black
        tabBar.barTintColor = .white
        viewControllers = [homeVC, cartVC]
    }
}
