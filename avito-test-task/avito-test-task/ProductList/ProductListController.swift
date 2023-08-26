//
//  ProductListController.swift
//  avito-test-task
//
//  Created by Masha on 25.08.2023.
//

import UIKit

class ProductListController: UIViewController {
    //    private var productViewModel: ProductViewModel
    //
    //    init(productViewModel: ProductViewModel) {
    //           self.productViewModel = productViewModel
    //           super.init(nibName: nil, bundle: nil)
    //       }
    //
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
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
        let jsonUrlString = "https://www.avito.st/s/interns-ios/main-page.json"
               guard let url = URL(string: jsonUrlString) else { return }
               URLSession.shared.dataTask(with: url) { (data, response, error) in
                   
                   guard let data = data else { return }
                   var dataResponse: DataResponse?
                   do {
                       dataResponse = try JSONDecoder().decode(DataResponse.self, from: data)
                       if let advertisements = dataResponse?.advertisements {
                           self.products = advertisements
                       }
                       DispatchQueue.main.async {
                           self.collectionView.reloadData()
                       }
                   } catch let error {
                       print("error", error)
                   }
               }.resume()
    }
}

extension ProductListController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
}

extension ProductListController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.idProductCell, for: indexPath) as! ProductCell
            
            let product = products[indexPath.item]
            
            DispatchQueue.global().async {
                guard let imageUrl = URL(string: product.imageUrl ?? "" ) else { return }
                guard let imageData = try? Data(contentsOf: imageUrl) else { return }
                
                DispatchQueue.main.async {
                    cell.imageProduct.image =  UIImage(data: imageData)
                }
            }
            
            cell.titleProduct.text = product.title
            cell.priceProduct.text = product.price
            cell.locationProduct.text = product.location
            cell.createDateProduct.text = product.createdDate ?? " "
        
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
