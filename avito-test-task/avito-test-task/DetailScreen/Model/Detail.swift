//
//  Detail.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import Foundation

struct Detail: Decodable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: String?
    let createdDate: String
    let description: String
    let email: String
    let phoneNumber: String
    let address: String
    
    init?(dict: [String: Any]) {
        guard let id = dict["id"] as? String,
              let title = dict["title"] as? String,
              let price = dict["price"] as? String,
              let location = dict["location"] as? String,
              let imageUrl = dict["image_url"] as? String,
              let createdDate = dict["created_date"] as? String,
              let description = dict["description"] as? String,
              let email = dict["email"] as? String,
              let phoneNumber = dict["phone_number"] as? String,
              let address = dict["address"] as? String else { return nil }
        
        self.id = id
        self.title = title
        self.price = price
        self.location = location
        self.imageUrl = imageUrl
        self.createdDate = createdDate
        self.description = description
        self.email = email
        self.phoneNumber = phoneNumber
        self.address = address
    }
}
