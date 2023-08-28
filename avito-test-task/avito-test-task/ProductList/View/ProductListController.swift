//
//  ProductListController.swift
//  avito-test-task
//
//  Created by Masha on 25.08.2023.
//

import UIKit

class ProductListController: UIViewController {
    
    var productViewModel = ProductViewModel()
    
    private let url = "https://www.avito.st/s/interns-ios/main-page.json"
    private var products = [Product]()
    
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
    
    func fetchData() {
        productViewModel.getProducts { [weak self] response in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

extension ProductListController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productViewModel.numberOfItemsInSection()
    }
}

extension ProductListController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.idProductCell, for: indexPath) as! ProductCell
        
        let product = productViewModel.currentProduct(atIndexPath: indexPath)
        
        ProductNetworkService.downloadImage(url: product.imageUrl!) { image in
            cell.imageProduct.image = image
        }
        
        cell.titleProduct.text = product.title
        cell.priceProduct.text = product.price
        cell.locationProduct.text = product.location
        cell.createDateProduct.text = product.createdDate
        
        return cell
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
}
