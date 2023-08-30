//
//  DetailViewModelType.swift
//  avito-test-task
//
//  Created by Masha on 30.08.2023.
//

import Foundation

protocol DetailViewModelType {
    func getDetail(comletion: @escaping(GetDetailResponse) -> ())
    func controllerViewModel() -> DetailControllerViewModelType?
}
