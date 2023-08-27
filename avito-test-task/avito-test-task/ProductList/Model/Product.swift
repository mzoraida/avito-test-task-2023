//
//  Product.swift
//  avito-test-task
//
//  Created by Masha on 26.08.2023.
//

import Foundation

struct Advertisements: Decodable

{
    let advertisements: [Product]
}


struct Product: Decodable {
    let id: String
    let title: String
    let price: String
    let location: String
    let image_url: String?
    let created_date: String
}
