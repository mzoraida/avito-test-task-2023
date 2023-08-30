//
//  DetailNetworkService.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import Foundation
import UIKit

class DetailNetworkService: NSObject {
    static var id: String = "1"
    
    override init() {}
    
    static func getDetail(comletion: @escaping(Result<GetDetailResponse, Error>) -> ()) {
        let jsonUrlString = "https://www.avito.st/s/interns-ios/details/" + id + ".json"
        guard let url = URL(string: jsonUrlString) else { return }
        
        NetworkService.shared.getData(url: url) { (result) in
            switch result {
            case .success(let json):
                do {
                    if let jsonDict = json as? [String: Any] {
                        let response = try GetDetailResponse(json: jsonDict)
                        comletion(.success(response))
                    } else {
                        let error = NSError(domain: "Invalid JSON", code: 0, userInfo: nil)
                        comletion(.failure(error))
                    }
                } catch {
                    print(error)
                    comletion(.failure(error))
                }
            case .failure(let error):
                comletion(.failure(error))
            }
        }
    }
}
