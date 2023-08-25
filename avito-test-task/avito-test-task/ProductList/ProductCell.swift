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
        imageView.frame = CGRect(x: 10, y: 0, width: 30, height: 30)
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let titleProduct: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let priceProduct: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let locationProduct: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    let createDateProduct: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("OK")
        setupViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            titleProduct.topAnchor.constraint(equalTo: imageProduct.bottomAnchor),
            
            priceProduct.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceProduct.topAnchor.constraint(equalTo: titleProduct.bottomAnchor),
            
            locationProduct.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationProduct.topAnchor.constraint(equalTo: priceProduct.bottomAnchor),
            
            createDateProduct.leadingAnchor.constraint(equalTo: leadingAnchor),
            createDateProduct.topAnchor.constraint(equalTo: locationProduct.bottomAnchor),
            
            createDateProduct.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
