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
        button.setTitle(Constants.titleButton, for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Constants.buttonCornerRadius
        return button
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: Constants.errorLabelSizeText)
        label.text = Constants.textErrorLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupRetryButton()
        setupErrorLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupRetryButton() {
        addSubview(retryButton)
        
        NSLayoutConstraint.activate([
            retryButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            retryButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            retryButton.widthAnchor.constraint(equalTo: widthAnchor, constant: Constants.buttonWidthAnchorSides)
        ])
        
        retryButton.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
    }
    
    private func setupErrorLabel() {
        addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.errorLabelTopAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.errorLabelLeadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.errorLabelTrailingAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: retryButton.topAnchor)
        ])
    }
    
    @objc private func retryButtonTapped() {
        delegate?.retryButtonTapped()
    }
}

private enum Constants {
    static let titleButton = "Retry"
    static let textErrorLabel = "Ошибка соединения. Попробуйте снова."
    
    static let errorLabelTopAnchor: CGFloat = 300
    static let errorLabelLeadingAnchor: CGFloat = 20
    static let errorLabelTrailingAnchor: CGFloat = -20
    static let errorLabelSizeText: CGFloat = 16
    
    static let buttonCornerRadius: CGFloat = 8
    static let buttonWidthAnchorSides: CGFloat = -40
}
