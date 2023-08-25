//
//  ProductCell.swift
//  avito-test-task
//
//  Created by Masha on 25.08.2023.
//

import UIKit


class ProductCell: UICollectionViewCell {
    
    //    let imageProduct: UIImageView = {
    //        let imageView = UIImageView()
    //        imageView.contentMode = .scaleToFill
    //        return imageView
    //    }()
    
    let imageProduct: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let titleProduct: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let priceProduct: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let locationProduct: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 12)
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .gray
        return label
    }()
    
    let createDateProduct: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 12)
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
     
    }
    
    private func setupViews() {
        addSubview(imageProduct)
        addSubview(titleProduct)
        addSubview(priceProduct)
        addSubview(locationProduct)
        addSubview(createDateProduct)
        
        imageProduct.translatesAutoresizingMaskIntoConstraints = false
        titleProduct.translatesAutoresizingMaskIntoConstraints = false
        priceProduct.translatesAutoresizingMaskIntoConstraints = false
        locationProduct.translatesAutoresizingMaskIntoConstraints = false
        createDateProduct.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageProduct.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageProduct.topAnchor.constraint(equalTo: topAnchor),
            imageProduct.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titleProduct.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleProduct.topAnchor.constraint(equalTo: imageProduct.bottomAnchor, constant: 8),
            titleProduct.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            priceProduct.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceProduct.topAnchor.constraint(equalTo: titleProduct.bottomAnchor, constant: 8),
            priceProduct.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            locationProduct.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationProduct.topAnchor.constraint(equalTo: priceProduct.bottomAnchor, constant: 8),
            locationProduct.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            createDateProduct.leadingAnchor.constraint(equalTo: leadingAnchor),
            createDateProduct.topAnchor.constraint(equalTo: locationProduct.bottomAnchor, constant: 4),
            createDateProduct.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            createDateProduct.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
