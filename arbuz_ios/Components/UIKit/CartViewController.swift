//
//  MyViewResponsible.swift
//  arbuz
//
//  Created by Dias Yerlan on 19.05.2024.
//

import UIKit

class CartViewController: UIViewController {
    var collectionView: UICollectionView!
    var cartProducts: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - 30, height: view.frame.width / 3)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
        
        view.addSubview(collectionView)
    }
}

extension CartViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier, for: indexPath) as! ProductCell
        let product = cartProducts[indexPath.item]
        cell.configure(with: product)
        return cell
    }
}

extension CartViewController: UICollectionViewDelegate {
    // Implement any delegate methods if necessary
}
