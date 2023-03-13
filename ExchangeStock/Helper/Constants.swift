//
//  Constans.swift
//  Onboarding
//
//  Created by Kenan Baylan on 12.03.2023.
//

import Foundation


struct K {
    
    struct NavigationBar {
        static let navigationTitle =  "Settings"
        static let homeTitle = "Home"
    }
    
    
    struct Segue {
        static let showOnboardingScreen = "toOnboarding"
        static let showLoginSignup = "toLoginSignUp"

    }
    
    struct StoryboardId {
        
        static let main = "Main"
        static let mainTabbarController = "MainTabbarController"
        static let onboardingViewController = "OnboardingViewController"
    }
    
    
}
