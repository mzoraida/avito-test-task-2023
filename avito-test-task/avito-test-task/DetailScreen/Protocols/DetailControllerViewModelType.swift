//
//  DetailControllerViewModelType.swift
//  avito-test-task
//
//  Created by Masha on 30.08.2023.
//

import Foundation
import UIKit

protocol DetailControllerViewModelType: AnyObject {
    var id: String { get }
    var titleDetail: String { get }
    var priceDetail: String { get }
    var locationDetail: String { get }
    var createDateDetail: String { get }
    var imageUrl: String? { get }
    var descriptionDetail: String { get }
    var emailDetail: String { get }
    var phoneNumberDetail: String { get }
    var addressDetail: String { get }
    func loadImage(completion: @escaping (UIImage?) -> Void)
}
