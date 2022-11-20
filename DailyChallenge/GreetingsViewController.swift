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
        textField.placeholder = "Enter your name"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        
        return textField
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 10
        return button
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
        
        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(continueButton)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            helloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: helloLabel.leadingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            continueButton.widthAnchor.constraint(equalToConstant: 200),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        continueButton.setTitleColor(.white, for: .normal)
    }
}

