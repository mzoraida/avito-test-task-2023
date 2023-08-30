//
//  RetryViewController.swift
//  avito-test-task
//
//  Created by Masha on 30.08.2023.
//

import Foundation

import Foundation
import UIKit

protocol FailavleView {
    func retryButtonTapped(sender: Any?)
}

class RetryViewController: UIViewController {
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Установка красного фона
            view.backgroundColor = .red
            
            // Создание кнопки
            let retryButton = UIButton(type: .system)
            retryButton.setTitle("Retry", for: .normal)
            retryButton.setTitleColor(.white, for: .normal)
            retryButton.backgroundColor = .blue
            retryButton.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
            retryButton.center = view.center
            
            // Добавление действия кнопке
        retryButton.addTarget(self, action: #selector(retryButtonTapped(sender:)), for: .touchUpInside)
            
            // Добавление кнопки на экран
            view.addSubview(retryButton)
        }
        
    @objc func retryButtonTapped(sender: Any?) {
           if let failableView = self.parent as? FailavleView {
               failableView.retryButtonTapped(sender: sender)
           }
       }
}
