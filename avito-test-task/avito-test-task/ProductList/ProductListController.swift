//
//  ProductListController.swift
//  avito-test-task
//
//  Created by Masha on 25.08.2023.
//

import UIKit

class ProductListController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
        let itemPerRow: CGFloat = 2
        let sectionInsert = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.register(ProductCell.self, forCellWithReuseIdentifier: "productCell")
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16)
        ])
    }
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 15
        }

    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell
    
            cell.titleProduct.text = "Абонемент в фитнес клуб xfit на Кирова безлимит"
            cell.priceProduct.text = "3000 $"
            cell.locationProduct.text = "Новосибирск, Площадь Ленина"
            cell.createDateProduct.text = "Вчера, 14:11"
    
            return cell
        }
    }
    
    extension ProductListController: UICollectionViewDelegateFlowLayout {
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let paddingWidth = sectionInsert.left * (itemPerRow + 1)
            let availableWidth = collectionView.frame.width - paddingWidth
            let widthPerItem = availableWidth / itemPerRow
            return CGSize(width: widthPerItem, height: (widthPerItem + (widthPerItem * 0.6)))
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInsert
        }
        
        
}
