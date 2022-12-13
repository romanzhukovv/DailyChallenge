//
//  StartChallengeView.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 13.12.2022.
//

import UIKit

final class StartChallengeView: DCBaseView {
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.backgroundColor = Resources.Colors.accent
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .heavy)
        button.layer.cornerRadius = 10
        return button
    }()
    
    func startButtonAction(_ target: Any?, with action: Selector, for controlEvent: UIControl.Event) {
        startButton.addTarget(target, action: action, for: controlEvent)
    }
}

extension StartChallengeView {
    override func addViews() {
        super.addViews()
        
        setupViews(startButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
