//
//  PresenterManager.swift
//  Onboarding
//
//  Created by Kenan Baylan on 12.03.2023.
//

import UIKit


//View controller arası geçişi tek bir sayfadan yönetmek için böyle bir yapı oluşturuldu.

class PresenterManager {
    
    static let shared = PresenterManager()
    
    private init() {}
    
    enum VC {
        case mainTabbarController
        case onboarding
    }
    
    func showVC(vc: VC){
        
        var viewController : UIViewController
        
        switch vc {
            
        case .mainTabbarController :
            viewController = UIStoryboard(name: K.StoryboardId.main , bundle: nil).instantiateViewController(withIdentifier: K.StoryboardId.mainTabbarController )
            
        case .onboarding:
            viewController = UIStoryboard(name: K.StoryboardId.main , bundle: nil).instantiateViewController(withIdentifier: K.StoryboardId.onboardingViewController )
        }
        
        let SceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        if let sceneDelegate = SceneDelegate , let window = sceneDelegate.window  {
            window.rootViewController = viewController
        }
        
        
        
    }
    
    
    
    
}
