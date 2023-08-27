////
////  ProductsNetworkService.swift
////  avito-test-task
////
////  Created by Masha on 26.08.2023.
////
//
//import Foundation
//
//class ProductNetworkService: NSObject {
//    private override init () {}
//    
//   static func getProducts(comletion: @escaping(GetProductResponse) -> ()) {
//        let jsonUrlString = "https://www.avito.st/s/interns-ios/main-page.json"
//        
//        guard let url = URL(string: jsonUrlString) else { return }
//        
//        NetworkService.shared.getData(url: url) { (json) in
//            do {
//                let response = try GetProductResponse(json: json)
//                comletion(response)
//            } catch {
//                print(error)
//            }
//        }
//    }
//}
