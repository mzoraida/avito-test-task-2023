//
//  ProductCellViewModelType.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import Foundation
import UIKit

protocol ProductCellViewModelType: AnyObject {
    var titleProduct: String { get }
    var priceProduct: String { get }
    var locationProduct: String { get }
    var createDateProduct: String { get }
    var imageUrl: String? { get }
    func loadImage(completion: @escaping (UIImage?) -> Void)
}
