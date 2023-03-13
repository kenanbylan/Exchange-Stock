//
//  HomeViewController.swift
//  ExchangeStock
//
//  Created by Kenan Baylan on 13.03.2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupNavigationBar()
    }
    
    
    func setupNavigationBar() {
        self.title = K.NavigationBar.homeTitle
    }
    

  

}
