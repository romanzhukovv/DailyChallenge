//
//  GreetingsView.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 22.11.2022.
//

import UIKit

class GreetingsView: DCBaseView, UITextFieldDelegate {
    
    var delegate: GreetingsViewDelegate?
    
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
        textField.backgroundColor = .systemGray
        textField.font = .systemFont(ofSize: 30, weight: .bold)
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter your name",
            attributes: [
                .foregroundColor: UIColor.systemGray2,
                .font: UIFont.systemFont(ofSize: 20, weight: .bold)
                        ]
        )
        textField.layer.cornerRadius = 10
        return textField
    }()
}

extension GreetingsView {
    override func addViews() {
        super.addViews()
        
        setupView(helloLabel, nameTextField)
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
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(textFiledDidChange), for: .editingChanged)
    }
    
    @objc func textFiledDidChange() {
        delegate?.nameDidChange(nameTextCount: nameTextField.text?.count ?? 0)
    }
}
