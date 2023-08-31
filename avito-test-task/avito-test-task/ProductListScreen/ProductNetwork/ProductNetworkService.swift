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
    
    static func getProducts(completion: @escaping(Result<GetProductResponse, Error>) -> ()) {
        guard let url = URL(string: jsonUrlString) else { return }
        
        NetworkService.shared.getData(url: url) { result in
            switch result {
            case .success(let json):
                do {
                    if let jsonDict = json as? [String: Any] {
                        let response = try GetProductResponse(json: jsonDict)
                        completion(.success(response))
                    } else {
                        let error = NSError(domain: "Invalid JSON", code: 0, userInfo: nil)
                        completion(.failure(error))
                    }
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
