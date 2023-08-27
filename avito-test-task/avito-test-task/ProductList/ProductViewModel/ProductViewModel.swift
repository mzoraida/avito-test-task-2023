//
//  ProductViewModel.swift
//  avito-test-task
//
//  Created by Masha on 26.08.2023.
//

import Foundation

class ProductViewModel: NSObject {
    
    var productNetworkService = ProductNetworkService()
    
    private var products = [Product]()
    
    func getProducts(comletion: @escaping(GetProductResponse) -> ()) {
        ProductNetworkService.getProducts { [weak self] response in
            self?.products = response.products
            comletion(response)
        }
    }
    
    func numberOfItemsInSection() -> Int {
        return products.count
    }
    
    func currentProduct(atIndexPath indexPath: IndexPath) -> Product {
        return products[indexPath.item]
    }
}
