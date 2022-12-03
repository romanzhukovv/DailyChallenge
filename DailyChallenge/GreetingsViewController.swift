//
//  ViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 20.11.2022.
//

import UIKit

protocol GreetingsViewDelegate {
    func nameDidChange(nameTextCount: Int)
}

class GreetingsViewController: DCBaseViewController {
    
    private let greetingsView = GreetingsView()
    
    var delegate: GreetingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingsView.delegate = self
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
//        greetingsView.buttonAction(#selector(buttonTapped), target: self)
    }
    
//    @objc func buttonTapped() {
//        if greetingsView.nameWasEnter() {
//            delegate?.nameDidEnter()
//        }
//    }
}

extension GreetingsViewController: GreetingsViewDelegate {
    func nameDidChange(nameTextCount: Int) {
        delegate?.nameDidEnter(nameTextCount: nameTextCount)
    }
}

