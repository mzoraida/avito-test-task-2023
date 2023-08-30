//
//  ProductsNetworkService.swift
//  avito-test-task
//
//  Created by Masha on 26.08.2023.
//

import Foundation
import UIKit

class ProductNetworkService: NSObject {
    static let jsonUrlString = "https://www.avito.st/s/interns-ios/main-page.json"
    
    override init () {}
    
    static func getProducts(comletion: @escaping(Result<GetProductResponse, Error>) -> ()) {
        guard let url = URL(string: jsonUrlString) else { return }
        
        NetworkService.shared.getData(url: url) { result in
            switch result {
            case .success(let json):
                do {
                    if let jsonDict = json as? [String: Any] {
                        let response = try GetProductResponse(json: jsonDict)
                        comletion(.success(response))
                    } else {
                        let error = NSError(domain: "Invalid JSON", code: 0, userInfo: nil)
                        comletion(.failure(error))
                    }
                } catch {
                    print(error)
                    comletion(.failure(error))
                }
            case .failure(let error):
                comletion(.failure(error))
            }
        }
    }
}
