//
//  Challenge.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 22.11.2022.
//

import Foundation

struct Challenge: Hashable {
    let category: Category
    let name: String
    let image: String
    
    enum Category: String {
        case sport = "Спорт"
        case food = "Питание"
        case health = "Здоровье"
        case selfStudy = "Самообразование"
        case languages = "Иностранные языки"
        case awareness = "Осознанность"
        case reading = "Чтение"
        case secret = "Секрет"
    }
    
    func getChallenges() -> [Challenge] {
        [
            Challenge(category: .sport, name: "", image: "")
        ]
    }
}
