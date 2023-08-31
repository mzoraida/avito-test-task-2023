//
//  DetailViewModelType.swift
//  avito-test-task
//
//  Created by Masha on 30.08.2023.
//

import Foundation

protocol DetailViewModelType {
    func getDetail(completion: @escaping(Result<GetDetailResponse, Error>) -> ())
    func controllerViewModel() -> DetailControllerViewModelType?
}
