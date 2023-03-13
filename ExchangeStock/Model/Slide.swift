//
//  Slide.swift
//  Onboarding
//
//  Created by Kenan Baylan on 12.03.2023.
//

import Foundation


struct Slide {
    
    let imageName: String
    let title: String
    let description: String
    
    static let collectionViewData: [Slide] = [
        Slide(imageName: "mac", title: "Welcome to Exchange Tracking App", description: "With our app, you can easily track the prices and fluctuations of your favorite cryptocurrencies across multiple exchanges in real-time. Let's get started!"),
        
        Slide(imageName: "ipad", title: "Stay Ahead of the Game", description: "Our app provides you with up-to-date information and insights on the latest cryptocurrency market trends."),
        Slide(imageName: "iphone", title: "Manage Your Portfolio with Ease", description: "Our app allows you to easily manage and track your cryptocurrency portfolio across multiple exchanges, all in one place."),
        
    
        
    ]
    
    
    
}
