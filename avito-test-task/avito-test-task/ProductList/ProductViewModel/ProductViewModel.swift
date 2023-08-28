//
//  ProductViewModel.swift
//  avito-test-task
//
//  Created by Masha on 26.08.2023.
//

import Foundation

protocol ProductViewModelType {
    func numberOfItemsInSection() -> Int
    func getProducts(comletion: @escaping(GetProductResponse) -> ())
    func currentProduct(atIndexPath indexPath: IndexPath) -> Product
    func cellViewModel(indexPath: IndexPath) -> ProductCellViewModelType?
}

class ProductViewModel: ProductViewModelType {
    
    var productNetworkService = ProductNetworkService()
    
    var products = [Product]()
    
    func getProducts(comletion: @escaping(GetProductResponse) -> ()) {
        ProductNetworkService.getProducts { [weak self] response in
            self?.products = response.products
            comletion(response)
        }
    }
    
    func cellViewModel(indexPath: IndexPath) -> ProductCellViewModelType? {
        let product = products[indexPath.item]
        return ProductCellViewModel(product: product)
    }
    
    func numberOfItemsInSection() -> Int {
        return products.count
    }
    
    func currentProduct(atIndexPath indexPath: IndexPath) -> Product {
        return products[indexPath.item]
    }
}
