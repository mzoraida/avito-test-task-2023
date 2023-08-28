//
//  ProductCellViewModel.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import Foundation

protocol ProductCellViewModelType: AnyObject {
    var titleProduct: String { get }
    var priceProduct: String { get }
    var locationProduct: String { get }
    var createDateProduct: String { get }
}

class ProductCellViewModel: ProductCellViewModelType {
    
    private var product: Product
    
    var titleProduct: String {
        return product.title
    }
    
    var priceProduct: String {
        return product.price
    }
    
    var locationProduct: String {
        return product.location
    }
    
    var createDateProduct: String {
        return product.createdDate
    }
    
    init(product: Product) {
        self.product = product
    }
    
    
}
