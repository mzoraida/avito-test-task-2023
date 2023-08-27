//
//  NetworkService.swift
//  avito-test-task
//
//  Created by Masha on 26.08.2023.
//

import Foundation

class NetworkService {
    
    private init() {}
    static let shared = NetworkService()
    
    public func getData(url: URL, completion: @escaping (Any) -> ()) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("NETWORKSERVICE")
                DispatchQueue.main.async {
                    completion(json)
                    print("NETWORKSERVICE")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
