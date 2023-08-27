//
//  GetProductResponse.swift
//  avito-test-task
//
//  Created by Masha on 26.08.2023.
//

import Foundation

class GetProductResponse {
    let products: [Product]
    
    init(json: [String: Any]) throws {
        guard let advertisementsJSON = json["advertisements"] as? [[String: AnyObject]] else { throw NetworkError.failInternetError }
        
        var products = [Product]()
        for advertisementJSON in advertisementsJSON {
            guard let product = Product(dict: advertisementJSON) else { continue }
            products.append(product)
        }
        print(products)
        self.products = products
    }
}
