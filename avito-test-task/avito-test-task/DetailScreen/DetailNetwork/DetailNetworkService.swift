//
//  DetailNetworkService.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import Foundation
import UIKit

class DetailNetworkService {
    private init() {}
    
    static func getDetails(comletion: @escaping(GetDetailResponse) -> ()) {
        let jsonUrlString = "https://www.avito.st/s/interns-ios/details/1.json"
        guard let url = URL(string: jsonUrlString) else { return }
        
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetDetailResponse(json: json)
                comletion(response)
            } catch {
                print(error)
            }
        }
    }
    
    static func downloadImage(url: String, completion: @escaping (_ image: UIImage)->()) {
        
        if let image = Cache.shared.get(key: url) {
            completion(image)
        } else {
            DispatchQueue.global().async {
                guard let imageUrl = URL(string: url ) else { return }
                guard let imageData = try? Data(contentsOf: imageUrl) else { return }
                
                DispatchQueue.main.async {
                    guard let image = UIImage(data: imageData) else { return }
                    Cache.shared.save(key: url, value: image)
                    completion(image)
                }
            }
        }
    }
}
