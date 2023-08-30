//
//  DetailController.swift
//  avito-test-task
//
//  Created by Masha on 28.08.2023.
//

import UIKit

class DetailController: UIViewController {
    
    var detailViewModel: DetailViewModelType?
    private var retryView: RetryView?
    
    let loadingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    let imageDetail: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleDetail: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: sizeText.title)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let price: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: sizeText.price)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let location: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: sizeText.location)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = stringConstant.descriptionTitleLabel
        label.font = UIFont.boldSystemFont(ofSize: sizeText.descriptionTitle)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: sizeText.description)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let email: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: sizeText.email)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: sizeText.phoneNumber)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let address: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: sizeText.address)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailViewModel = DetailViewModel()
        
        setupViews()
        constraintsForDescription()
        constraintsViews()
        
        fetchData()
    }
    
    private func setupViews() {
        view.addSubview(imageDetail)
        view.addSubview(price)
        view.addSubview(titleDetail)
        view.addSubview(location)
        view.addSubview(descriptionTitleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(email)
        view.addSubview(phoneNumber)
        view.addSubview(address)
    }
    
    private func constraintsForDescription() {
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constraint.trailingAnchorDescription).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraint.leadingAnchor).isActive = true
    }
    
    private func constraintsViews() {
        NSLayoutConstraint.activate([
            imageDetail.topAnchor.constraint(equalTo: view.topAnchor, constant: Constraint.topAnchorImage),
            imageDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageDetail.widthAnchor.constraint(equalToConstant: view.bounds.width),
            imageDetail.heightAnchor.constraint(equalToConstant: view.bounds.width),
            
            price.topAnchor.constraint(equalTo: imageDetail.bottomAnchor, constant: Constraint.topAnchorPrice),
            price.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraint.leadingAnchor),
            
            titleDetail.topAnchor.constraint(equalTo: price.bottomAnchor, constant: Constraint.topAnchorTitle),
            titleDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraint.leadingAnchor),
            
            location.topAnchor.constraint(equalTo: titleDetail.bottomAnchor, constant: Constraint.topAnchorLocation),
            location.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraint.leadingAnchor),
            
            address.topAnchor.constraint(equalTo: location.bottomAnchor, constant: Constraint.topAnchorAddress),
            address.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraint.leadingAnchor),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: address.bottomAnchor, constant: Constraint.topAnchorDescriptionTitle),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraint.leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: Constraint.topAnchorDescription),
            
            email.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constraint.topAnchorEmail),
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraint.leadingAnchor),
            
            phoneNumber.topAnchor.constraint(equalTo: email.bottomAnchor, constant: Constraint.topAnchorPhoneNumber),
            phoneNumber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraint.leadingAnchor)
        ])
    }
    
    weak var detailViewModels: DetailControllerViewModelType? {
        willSet(detailViewModel) {
            guard let detailViewModel = detailViewModel else { return }
            titleDetail.text = detailViewModel.titleDetail
            price.text = detailViewModel.priceDetail
            location.text = stringConstant.location + detailViewModel.locationDetail
            descriptionLabel.text = detailViewModel.descriptionDetail
            email.text = stringConstant.email + detailViewModel.emailDetail
            phoneNumber.text = stringConstant.phoneNumber + detailViewModel.phoneNumberDetail
            address.text = detailViewModel.addressDetail
            
            detailViewModel.loadImage { [weak self] image in
                self?.imageDetail.image = image
            }
        }
    }
    
    private func showLoadingView() {
        view.addSubview(loadingView)
        loadingView.addSubview(loadingIndicator)
        
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            loadingIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor)
        ])
        
        loadingIndicator.startAnimating()
    }
    
    private func hideLoadingView() {
        loadingIndicator.stopAnimating()
        loadingView.removeFromSuperview()
    }
    
    private func fetchData() {
        showLoadingView()
        
        detailViewModel?.getDetail { [weak self] result in
            
            DispatchQueue.main.async {
                self?.hideLoadingView()
                switch result {
                case .success(_):
                    let controllerDetailViewModel = self?.detailViewModel?.controllerViewModel()
                    self?.detailViewModels = controllerDetailViewModel
                case .failure(let error):
                    self?.showRetryView()
                    print("Error fetching data: \(error)")
                }
            }
        }
    }
    
    private func showRetryView() {
        retryView = RetryView(frame: view.bounds)
        retryView?.delegate = self
        view.addSubview(retryView!)
    }
    
    private func hideRetryView() {
        retryView?.removeFromSuperview()
        retryView = nil
    }
}

extension DetailController: RetryViewDelegate {
    func retryButtonTapped() {
        hideRetryView()
        fetchData()
    }
}

private enum Constraint {
    static let trailingAnchorDescription: CGFloat = -10
    static let leadingAnchorDescription: CGFloat = 20
    
    static let leadingAnchor: CGFloat = 20
    
    static let topAnchorImage: CGFloat = 100
    static let topAnchorPrice: CGFloat = 8
    static let topAnchorTitle: CGFloat = 4
    static let topAnchorLocation: CGFloat = 4
    static let topAnchorAddress: CGFloat = 1
    static let topAnchorDescriptionTitle: CGFloat = 16
    static let topAnchorDescription: CGFloat = 2
    static let topAnchorEmail: CGFloat = 16
    static let topAnchorPhoneNumber: CGFloat = 1
}

private enum sizeText {
    static let title: CGFloat = 18
    static let price: CGFloat = 26
    static let location: CGFloat = 14
    static let address: CGFloat = 14
    static let descriptionTitle: CGFloat = 24
    static let description: CGFloat = 16
    static let email: CGFloat = 14
    static let phoneNumber: CGFloat = 14
}

private enum stringConstant {
    static let location = "Город "
    static let email = "Почта: "
    static let phoneNumber = "Телефон: "
    static let descriptionTitleLabel = "ОПИСАНИЕ"
}
