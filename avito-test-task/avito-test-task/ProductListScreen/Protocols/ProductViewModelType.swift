//
//  ProductViewModelType.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import Foundation

protocol ProductViewModelType {
    func numberOfItemsInSection() -> Int
    func getProducts(comletion: @escaping(GetProductResponse) -> ())
    func cellViewModel(indexPath: IndexPath) -> ProductCellViewModelType?
}
