//
//  Product.swift
//  avito-test-task
//
//  Created by Masha on 26.08.2023.
//

import Foundation

struct Advertisements
{
    let advertisements: [Product]
}

extension Advertisements: Decodable {
    enum CodingKeys: String, CodingKey {
        case advertisements = "advertisements"
    }
}

struct Product {
    var id: String
    var title: String
    var price: String
    var location: String
    var imageUrl: String?
    var createdDate: String
}

extension Product: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case location = "location"
        case imageUrl = "image_url"
        case createdDate = "created_date"
    }
}
