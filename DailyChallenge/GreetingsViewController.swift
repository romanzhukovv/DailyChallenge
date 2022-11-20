//
//  ViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 20.11.2022.
//

import UIKit

class GreetingsViewController: DCBaseViewController {
    
    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, tell me your name please:"
        label.textColor = .systemCyan
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension GreetingsViewController {
    override func addViews() {
        super.addViews()
        
        view.addSubview(helloLabel)
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            helloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
    }
}

