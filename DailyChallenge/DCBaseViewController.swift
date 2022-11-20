//
//  DCBaseViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 20.11.2022.
//

import UIKit

class DCBaseViewController: UIViewController {
    override func viewDidLoad() {
        addViews()
        layoutViews()
        configureViews()
    }
}

@objc extension DCBaseViewController {
    func addViews() {
        
    }
    
    func layoutViews() {
        
    }
    
    func configureViews() {
        view.backgroundColor = .black
    }
}
