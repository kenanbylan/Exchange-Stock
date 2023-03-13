//
//  SettingsViewController.swift
//  Onboarding
//
//  Created by Kenan Baylan on 12.03.2023.
//

import UIKit


class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    
    private func setupViews(){
        view.backgroundColor = .green
    }
    
    
    //MARK: - Actions
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        
        PresenterManager.shared.showVC(vc: .onboarding)
        
        
    }
    
}




