//
//  LoadingScreen.swift
//  avito-test-task
//
//  Created by Masha on 30.08.2023.
//

import Foundation

import Foundation
import UIKit

class LoadingViewController: UIViewController {
    override func viewDidLoad() {
         super.viewDidLoad()
         
         let loadingLabel = UILabel()
         loadingLabel.text = "Loading..."
         loadingLabel.textColor = UIColor.black
         loadingLabel.textAlignment = .center
         loadingLabel.translatesAutoresizingMaskIntoConstraints = false
         
         view.backgroundColor = UIColor.yellow
         view.addSubview(loadingLabel)
         
         let centerX = NSLayoutConstraint(item: loadingLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
         let centerY = NSLayoutConstraint(item: loadingLabel, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
         
         view.addConstraints([centerX, centerY])
     }
}
