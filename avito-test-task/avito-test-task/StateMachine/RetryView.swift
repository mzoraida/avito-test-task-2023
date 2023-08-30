//
//  RetryView.swift
//  avito-test-task
//
//  Created by Masha on 30.08.2023.
//

import Foundation
import UIKit

protocol RetryViewDelegate: AnyObject {
    func retryButtonTapped()
}

class RetryView: UIView {
    
    weak var delegate: RetryViewDelegate?
    
    private let retryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Retry", for: .normal)
        button.backgroundColor = .cyan
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupRetryButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupRetryButton() {
        addSubview(retryButton)
        
        NSLayoutConstraint.activate([
            retryButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            retryButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        retryButton.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
    }
    
    @objc private func retryButtonTapped() {
        delegate?.retryButtonTapped()
    }
}
