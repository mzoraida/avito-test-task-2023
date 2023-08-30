//
//  LoadingImage.swift
//  avito-test-task
//
//  Created by Masha on 30.08.2023.
//

import Foundation
import UIKit

class LoadingImage {
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
