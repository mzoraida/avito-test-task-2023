//
//  Product.swift
//  avito-test-task
//
//  Created by Masha on 26.08.2023.
//

import Foundation

//struct Advertisements: Decodable {
//
//    let advertisements: [Product]
//}
//
//struct Product: Decodable {
//    let id: String
//    let title: String
//    let price: String
//    let location: String
//    let image_url: String?
//    let created_date: String
//}

struct Advertisements: Decodable {
let advertisements: [Product]
}

struct Product: Decodable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: String?
    let createdDate: String
    
    init?(dict: [String: Any]) {
        guard let id = dict["id"] as? String,
              let title = dict["title"] as? String,
              let price = dict["price"] as? String,
              let location = dict["location"] as? String,
              let imageUrl = dict["image_url"] as? String,
              let createdDate = dict["created_date"] as? String else {
            return nil
        }
        
        self.id = id
        self.title = title
        self.price = price
        self.location = location
        self.imageUrl = imageUrl
        self.createdDate = createdDate
    }
}
