//
//  MyView.swift
//  arbuz
//
//  Created by Dias Yerlan on 19.05.2024.
//

import UIKit

class ProductCell: UICollectionViewCell {
    static let reuseIdentifier = "ProductCell"
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let countLabel = UILabel()
    let priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        
        contentView.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        countLabel.textAlignment = .center
        countLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(countLabel)
        contentView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),

            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 22),
            
            countLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 22),

            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 22),

        ])
    }
    
    func configure(with product: Product) {
        imageView.image = UIImage(named: product.image)
        titleLabel.text = product.title
        countLabel.text = "Quantity: \(product.count)" 
        priceLabel.text = "\(product.price) ₸"
    }
}
