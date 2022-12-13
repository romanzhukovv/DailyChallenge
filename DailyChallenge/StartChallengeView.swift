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
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        startButton.layer.cornerRadius = startButton.frame.width / 2
    }
    
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
            startButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 100),
            startButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
