//  LoadingViewController.swift
//  Onboarding
//  Created by Kenan Baylan on 12.03.2023.


import UIKit

class LoadingViewController : UIViewController {
    
    //MARK: - Variables
    private let isUserLogin = false
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        delay(durationInSeconds: 2.0) {
            self.showInitialView()
        }
        
    }
    
    
    //MARK: - Functions
    private func setupView(){
        //view.backgroundColor = .lightGray
    }
    
    
    
    private func showInitialView(){
        // if user login --> main tabbar view -  if user not login --> onboarding screen
        if isUserLogin {
            
            PresenterManager.shared.showVC(vc: .mainTabbarController)
            
        } else {
            
            //PresenterManager.shared.showVC(vc: .onboarding)
              performSegue(withIdentifier: K.Segue.showOnboardingScreen, sender: nil)
        }
    }
    
    
    
}
