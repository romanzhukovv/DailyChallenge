//
//  Resources.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 20.11.2022.
//

import UIKit

enum Resources {
    enum Colors {
        static let background = UIColor(hexString: "#161616")
        static let accent = UIColor(hexString: "#DA4382")
    }
    
    enum Strings {
        enum Onboarding {
            static let description = """
                        Выбирай категории по интересам. А мы сгенерируем для тебя задачи на каждый день по ним.
                        Новый день - новое задание.
                        Следи за своей статистикой.
                        """
        }
    }
    
    enum Images {
        static let nextButton = UIImage(named: "nextButton")
    }
}
