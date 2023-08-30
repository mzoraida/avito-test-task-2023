//
//  DetailViewModel.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    var detailNetworkService = DetailNetworkService()
    
    var details: Detail? = nil
    
    func getDetail(comletion: @escaping(Result<GetDetailResponse, Error>) -> ()) {
        DetailNetworkService.getDetail { [weak self] result in
            switch result {
            case .success(let response):
                self?.details = response.details
                comletion(.success(response))
            case .failure(let error):
                comletion(.failure(error))
            }
        }
    }
    
    func controllerViewModel() -> DetailControllerViewModelType? {
        return DetailControllerViewModel(detail: details!)
    }
    
}
