//
//  ProductViewModel.swift
//  avito-test-task
//
//  Created by Masha on 26.08.2023.
//

import Foundation

class ProductViewModel: ProductViewModelType {
    
    var productNetworkService = ProductNetworkService()
    
    var products = [Product]()
    
    func getProducts(comletion: @escaping(Result<GetProductResponse, Error>) -> ()) {
        ProductNetworkService.getProducts { [weak self] result in
            switch result {
            case .success(let response):
                self?.products = response.products
                comletion(.success(response))
            case .failure(let error):
                comletion(.failure(error))
            }
        }
    }
    
    func cellViewModel(indexPath: IndexPath) -> ProductCellViewModelType? {
        let product = products[indexPath.item]
        return ProductCellViewModel(product: product)
    }
    
    func numberOfItemsInSection() -> Int {
        return products.count
    }
}
