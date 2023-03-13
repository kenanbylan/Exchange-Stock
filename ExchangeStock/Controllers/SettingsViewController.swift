//
//  SettingsViewController.swift
//  Onboarding
//
//  Created by Kenan Baylan on 12.03.2023.
//

import UIKit
import MBProgressHUD


class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    
    
    func setupNavigationBar() {
        self.title = K.NavigationBar.navigationTitle
    }
    
    //MARK: - Actions
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(durationInSeconds: 0.5 ) {
            MBProgressHUD.hide(for: self.view, animated: true)
                PresenterManager.shared.showVC(vc: .onboarding)
        }
    }
}




