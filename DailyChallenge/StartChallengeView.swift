//
//  StartChallengeView.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 13.12.2022.
//

import UIKit

final class StartChallengeView: DCBaseView {
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.backgroundColor = Resources.Colors.accent
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .heavy)
        button.layer.cornerRadius = 10
        return button
    }()
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
    
    override func configureViews() {
        super.configureViews()
        
//        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
}
