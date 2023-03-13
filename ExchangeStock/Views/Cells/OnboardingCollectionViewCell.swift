//
//  onboardingCollectionViewCell.swift
//  Onboarding
//
//  Created by Kenan Baylan on 12.03.2023.
//

import Foundation
import UIKit

class OnboardingCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var slideImageView : UIImageView!
    
    
    func configure(image: UIImage) {
        slideImageView.image = image
    }
    
    
    
}
