//
//  DetailController.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import UIKit

class DetailController: UIViewController {
    
    var details = [Detail]()
    
    let imageDetail: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleDetail: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let price: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let location: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let email: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let address: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraintsViews()
//        imageDetail.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        imageDetail.heightAnchor.constraint(equalToConstant: 400).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        fetchData()
        
        titleDetail.text = details.first?.title
    }
    
    private func fetchData() {
        DetailNetworkService.getDetails { (response) in
            self.details = response.details
        }
    }
    
    private func constraintsViews() {
        view.addSubview(imageDetail)
        view.addSubview(price)
        view.addSubview(titleDetail)
        view.addSubview(location)
        view.addSubview(descriptionTitleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(email)
        view.addSubview(phoneNumber)
        view.addSubview(address)
        
        NSLayoutConstraint.activate([
            imageDetail.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            imageDetail.heightAnchor.constraint(equalToConstant: contentView.frame.width),
            
            price.topAnchor.constraint(equalTo: imageDetail.bottomAnchor, constant: 8),
            price.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            titleDetail.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 4),
            titleDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            location.topAnchor.constraint(equalTo: titleDetail.bottomAnchor, constant: 4),
            location.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            address.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 1),
            address.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 16),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 2),
            
            email.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            phoneNumber.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 1),
            phoneNumber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
