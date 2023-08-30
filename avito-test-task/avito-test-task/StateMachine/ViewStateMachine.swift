//
//  ViewStateMachine.swift
//  avito-test-task
//
//  Created by Masha on 30.08.2023.
//

import Foundation
import UIKit

class ViewStateMachine: UIViewController {
    let loadingViewController = LoadingViewController()
    let retryViewController = RetryViewController()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
            super.init(nibName: nil, bundle: nil)
            buildSubviews()
        }
    
    required init?(coder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
        buildSubviews()
    }
    
    private func buildSubviews() {
        addLockingView(viewController: retryViewController)
        addLockingView(viewController: loadingViewController)
        
        loadingViewController.view.alpha = 0
        retryViewController.view.alpha = 0
    }
    
    @objc func setToRetry() {
        view.bringSubviewToFront(retryViewController.view)
        UIView.animate(withDuration: 0.3) {
            self.loadingViewController.view.alpha = 0
        }
        retryViewController.view.alpha = 1
    }
    
    func setToLoading() {
        view.bringSubviewToFront(loadingViewController.view)
        UIView.animate(withDuration: 0.3) {
            self.retryViewController.view.alpha = 0
        }
        self.loadingViewController.view.alpha = 1
    }
    
    func doneLoading() {
        UIView.animate(withDuration: 0.3) {
            self.retryViewController.view.alpha = 0
            self.loadingViewController.view.alpha = 0
        }
        
    }
    
    @objc func addLockingView(viewController: UIViewController) {
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        
        viewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}
