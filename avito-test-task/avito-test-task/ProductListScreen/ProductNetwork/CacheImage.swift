//
//  CacheImage.swift
//  avito-test-task
//
//  Created by Masha on 26.08.2023.
//

import Foundation
import UIKit

class Cache {
    
    static var shared = Cache()
    
    private var dict: Dictionary<String, UIImage> = [:]
    
    func save(key: String?, value: UIImage) {
        dict[key ?? ""] = value
    }
    
    func get(key: String?) -> UIImage? {
        return dict[key ?? ""]
    }
}
