//
//  GetDetailResponse.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import Foundation

//struct GetDetailResponse {
//    let details: [Detail]
//
//    init(json: Any) throws {
//        guard let array = json as? [String: Any] else { throw NetworkError.failInternetError }
//
//        var details = [Detail]()
//        for value in array.values {
//            guard let dict = value as? [String: Any],
//                  let detail = Detail(dict: dict) else {
//                continue
//            }
//            print(details)
//            details.append(detail)
//        }
//        self.details = details
//    }
//}

struct GetDetailResponse {
    let details: Detail
    
    init(json: [String: Any]) throws {
        guard let details = Detail(dict: json) else {
            throw NetworkError.failInternetError
        }
        self.details = details
    }
}


//struct GetDetailResponse {
//    let details: [Detail]
//
//    init(json: [String: Any]) throws {  // Change the parameter type to [String: Any]
//        var details = [Detail]()
//        for (_, value) in json {  // Iterate over the dictionary entries using (_, value)
//            guard let dict = value as? [String: Any],
//                  let detail = Detail(dict: dict) else {
//                continue
//            }
//            details.append(detail)
//        }
//        self.details = details
//    }
//}


