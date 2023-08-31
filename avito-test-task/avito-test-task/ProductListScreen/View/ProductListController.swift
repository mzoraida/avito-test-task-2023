//
//  ProductListController.swift
//  avito-test-task
//
//  Created by Masha on 25.08.2023.
//

import UIKit

class ProductListController: UIViewController {
    
    var productViewModel: ProductViewModelType?
    private var retryView: RetryView?
    private var loadingView: LoadingView?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.register(ProductCell.self, forCellWithReuseIdentifier: Constant.idProductCell)
        collection.delegate = self
        collection.dataSource = self
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productViewModel = ProductViewModel()
        setupViews()
        setupConstraints()
        fetchData()
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: Constant.constraintMax),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: Constant.constraintMin)
        ])
    }
    
    private func fetchData() {
        showLoadingView()
        
        productViewModel?.getProducts { [weak self] result in
            DispatchQueue.main.async {
                self?.hideLoadingView()
                
                switch result {
                case .success(_):
                    self?.collectionView.reloadData()
                case .failure(let error):
                    self?.showRetryView()
                    print("Error fetching data: \(error)")
                }
            }
        }
    }
    
    private func showLoadingView() {
        loadingView = LoadingView(frame: view.bounds)
        view.addSubview(loadingView!)
    }
    
    private func hideLoadingView() {
        loadingView?.removeFromSuperview()
        loadingView = nil
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

extension ProductListController: RetryViewDelegate {
    func retryButtonTapped() {
        hideRetryView()
        fetchData()
    }
}

extension ProductListController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productViewModel?.numberOfItemsInSection() ?? 0
    }
}

extension ProductListController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.idProductCell, for: indexPath) as! ProductCell
        
        guard let productViewModel = productViewModel else { return UICollectionViewCell() }
        let cellProductViewModel = productViewModel.cellViewModel(indexPath: indexPath)
        cell.productViewModel = cellProductViewModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let detailController = storyboard?.instantiateViewController(withIdentifier: Constant.idDetailController) as? DetailController else { return }
        DetailNetworkService.id = productViewModel?.cellViewModel(indexPath: indexPath)?.id ?? ""
        navigationController?.pushViewController(detailController, animated: true)
    }
}

extension ProductListController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = Constant.sectionInsert.left * (Constant.itemPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / Constant.itemPerRow
        
        return CGSize(width: widthPerItem, height: (widthPerItem + widthPerItem * Constant.coefficientHeight))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Constant.sectionInsert
    }
}

private enum Constant {
    static let itemPerRow: CGFloat = 2
    static let sectionInsert = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    
    static let constraintMax: CGFloat = 16
    static let constraintMin: CGFloat = -16
    static let coefficientHeight = 0.6
    
    static let idProductCell = "productCell"
    static let idDetailController = "DetailController"
}
