//
//  DataManager.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 20.11.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    let categories: [Category] = [
        .sport,
        .food,
        .health,
        .selfDevelopment
    ]
    
    let sportChallenges = [
        "",
        ""
    ]
    
    enum Category: String {
        case sport = "Спорт"
        case food = "Питание"
        case health = "Здоровье"
        case selfDevelopment = "Саморазвитие"
    }
    
}
