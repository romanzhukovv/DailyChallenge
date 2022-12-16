//
//  GreetingsView.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 22.11.2022.
//

import UIKit

class GreetingsView: DCBaseView, UITextFieldDelegate {
    
    weak var delegate: GreetingsViewDelegate?
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        endEditing(true)
    }
}

extension GreetingsView {
    override func addViews() {
        super.addViews()
        
        setupViews(helloLabel, nameTextField)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            helloLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
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
    
    @objc func keyboardWillShow() {
        if frame.origin.y == 0 {
            frame.origin.y -= 70
        }
    }
    
    @objc func keyboardWillHide() {
        if frame.origin.y != 0 {
            frame.origin.y = 0
        }
    }
}
