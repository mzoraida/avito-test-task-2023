//
//  GetDetailResponse.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import Foundation

struct GetDetailResponse {
    let details: [Detail]
    
    init(json: Any) throws {
        guard let array = json as? [[String: AnyObject]] else { throw NetworkError.failInternetError }
        
        var details = [Detail]()
        for dictionary in array {
            guard let detail = Detail(dict: dictionary) else { continue }
            details.append(detail)
        }
        self.details = details
        print(details)
    }
}
