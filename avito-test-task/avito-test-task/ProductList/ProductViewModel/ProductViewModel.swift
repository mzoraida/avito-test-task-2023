//
//  ProductViewModel.swift
//  avito-test-task
//
//  Created by Masha on 26.08.2023.
//

import Foundation

//class ProductViewModel: NSObject {
//    
//    //    @IBOutlet weak var productNetworkService: ProductNetworkService!
//    
//    private var productNetworkService: ProductNetworkService
//    
//    init(productNetworkService: ProductNetworkService) {
//        self.productNetworkService = productNetworkService
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private var products = [Product]()
//    
//    func getProducts(comletion: @escaping(GetProductResponse) -> ()) {
//        ProductNetworkService.getProducts { [weak self] response in
//            self?.products = response.products
//            comletion(response)
//        }
//    }
//    
//    func numberOfItemsInSection() -> Int {
//        return products.count
//    }
//}
