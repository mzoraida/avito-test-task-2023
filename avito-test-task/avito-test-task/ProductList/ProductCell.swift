//
//  ProductCell.swift
//  avito-test-task
//
//  Created by Masha on 25.08.2023.
//

import UIKit


class ProductCell: UICollectionViewCell {
    
    let imageProduct: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //    let imageProduct: UIView = {
    //        let imageView = UIView()
    //        imageView.backgroundColor = .blue
    //        return imageView
    //    }()
    
    let titleProduct: UILabel = {
        let label = UILabel()
        label.numberOfLines = NumberOfLines.titleProduct
        label.font = UIFont.boldSystemFont(ofSize: SizeLabel.titleProduct)
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let priceProduct: UILabel = {
        let label = UILabel()
        label.numberOfLines = NumberOfLines.priceProduct
        label.font = UIFont.boldSystemFont(ofSize: SizeLabel.priceProduct)
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let locationProduct: UILabel = {
        let label = UILabel()
        label.numberOfLines = NumberOfLines.locationProduct
        label.font = UIFont.systemFont(ofSize: SizeLabel.locationProduct)
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .gray
        return label
    }()
    
    let createDateProduct: UILabel = {
        let label = UILabel()
        label.numberOfLines = NumberOfLines.createDateProduct
        label.font = UIFont.systemFont(ofSize: SizeLabel.createDateProduct)
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintsViews()
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
    }
    
    private func constraintsViews() {
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
            titleProduct.topAnchor.constraint(equalTo: imageProduct.bottomAnchor, constant: Constraint.max),
            titleProduct.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            priceProduct.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceProduct.topAnchor.constraint(equalTo: titleProduct.bottomAnchor, constant: Constraint.max),
            priceProduct.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            locationProduct.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationProduct.topAnchor.constraint(equalTo: priceProduct.bottomAnchor, constant: Constraint.max),
            locationProduct.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            createDateProduct.leadingAnchor.constraint(equalTo: leadingAnchor),
            createDateProduct.topAnchor.constraint(equalTo: locationProduct.bottomAnchor, constant: Constraint.min),
            createDateProduct.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            createDateProduct.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

private enum Constraint {
    static let max: CGFloat = 8
    static let min: CGFloat = 4
}

private enum SizeLabel {
    static let titleProduct: CGFloat = 14
    static let priceProduct: CGFloat = 16
    static let locationProduct: CGFloat = 12
    static let createDateProduct: CGFloat = 12
}

private enum NumberOfLines {
    static let titleProduct = 2
    static let priceProduct = 1
    static let locationProduct = 1
    static let createDateProduct = 1
}
