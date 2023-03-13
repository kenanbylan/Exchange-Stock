//
//  Utils.swift
//  Onboarding
//
//  Created by Kenan Baylan on 12.03.2023.
//

import Foundation


func delay(durationInSeconds seconds: Double , completion: @escaping ()->Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds , execute: completion)
}
