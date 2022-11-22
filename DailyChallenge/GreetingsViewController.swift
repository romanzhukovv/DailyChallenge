//
//  ViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 20.11.2022.
//

import UIKit

class GreetingsViewController: DCBaseViewController {
    
    private let greetingsView = GreetingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension GreetingsViewController {
    override func addViews() {
        super.addViews()
        view.setupView(greetingsView)
        
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            greetingsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            greetingsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            greetingsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greetingsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    override func configureViews() {
        super.configureViews()
    }
}

