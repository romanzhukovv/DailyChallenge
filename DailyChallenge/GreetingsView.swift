//
//  GreetingsView.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 22.11.2022.
//

import UIKit

class GreetingsView: DCBaseView {
    
    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, tell me your name please:"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 30, weight: .bold)
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter your name",
            attributes: [
                .foregroundColor: UIColor.systemGray,
                .font: UIFont.systemFont(ofSize: 20, weight: .bold)
                        ]
        )
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .systemPink
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .heavy)
        button.layer.cornerRadius = 10
        return button
    }()
    
    func buttonAction(_ action: Selector, target: Any?) {
        continueButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension GreetingsView {
    override func addViews() {
        super.addViews()
        
        setupView(helloLabel)
        setupView(nameTextField)
        setupView(continueButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            helloLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            helloLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: helloLabel.leadingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            continueButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            continueButton.widthAnchor.constraint(equalToConstant: 200),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
    }
}
