//
//  NetworkManager.swift
//  avito-test-task
//
//  Created by Masha on 27.08.2023.
//

import UIKit

class NetworkManager {
    
    static func fetchData(url: String, completion: @escaping ( _ products: [Product])->()) {
       
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            var advertisements: Advertisements?
            
            do {
                advertisements = try JSONDecoder().decode(Advertisements.self, from: data)
                if let advertisement = advertisements?.advertisements {
                    let products = advertisement
                    completion(products)
                }
            } catch let error {
                print("error", error)
            }
            
        }.resume()
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
