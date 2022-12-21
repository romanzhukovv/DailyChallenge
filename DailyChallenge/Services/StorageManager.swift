//
//  StorageManager.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 20.11.2022.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    
    func setOnboardingStatus() {
        userDefaults.set(true, forKey: "onboardingIsViewed")
    }
    
    func getOnboardingStatus() -> Bool {
        userDefaults.bool(forKey: "onboardingIsViewed")
    }
}
