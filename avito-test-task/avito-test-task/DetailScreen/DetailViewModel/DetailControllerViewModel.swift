//
//  DetailControllerViewModel.swift
//  avito-test-task
//
//  Created by Masha on 29.08.2023.
//

import Foundation
import UIKit

class DetailControllerViewModel: DetailControllerViewModelType {
    
    private var detail: Detail
    
    var id: String {
        return detail.id
    }
    
    var titleDetail: String {
        return detail.title
    }
    
    var priceDetail: String  {
        return detail.price
    }
    
    var locationDetail: String {
        return detail.location
    }
    
    var createDateDetail: String {
        return detail.createdDate
    }
    
    var imageUrl: String? {
        return detail.imageUrl
    }
    
    var descriptionDetail: String {
        return detail.description
    }
    
    var emailDetail: String {
        return detail.email
    }
    
    var phoneNumberDetail: String {
        return detail.phoneNumber
    }
    
    var addressDetail: String {
        return detail.address
    }
    
    init(detail: Detail) {
        self.detail = detail
    }
    
    func loadImage(completion: @escaping (UIImage?) -> Void) {
        guard let imageUrl = detail.imageUrl else {
            completion(nil)
            return
        }
        
        DetailNetworkService.downloadImage(url: imageUrl) { image in
            completion(image)
        }
    }
    
}
