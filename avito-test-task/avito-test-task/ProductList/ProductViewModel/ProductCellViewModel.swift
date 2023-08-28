//
//  ProductCellViewModel.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import Foundation
import UIKit

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
    
    var imageUrl: String? {
        return product.imageUrl
    }
    
    init(product: Product) {
        self.product = product
    }
    
    func loadImage(completion: @escaping (UIImage?) -> Void) {
        guard let imageUrl = product.imageUrl else {
            completion(nil)
            return
        }
        
        ProductNetworkService.downloadImage(url: imageUrl) { image in
            completion(image)
        }
    }
    
}
