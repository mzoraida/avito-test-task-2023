//
//  GetDetailResponse.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import Foundation

class GetDetailResponse {
    let details: Detail
    
    init(json: [String: Any]) throws {
        guard let details = Detail(dict: json) else { throw NetworkError.failInternetError }
        self.details = details
    }
}
