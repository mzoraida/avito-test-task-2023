//
//  DetailViewModel.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import Foundation

class DetailViewModel {
    var detailNetworkService = DetailNetworkService()
    
    var details: Detail? = nil
    
    func getDetail(comletion: @escaping(GetDetailResponse) -> ()) {
        DetailNetworkService.getDetails { [weak self] response in
            self?.details = response.details
            comletion(response)
        }
    }
    
    
}
