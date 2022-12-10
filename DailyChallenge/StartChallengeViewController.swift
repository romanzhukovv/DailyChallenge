//
//  StartChallengeViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 27.11.2022.
//

import UIKit

final class StartChallengeViewController: DCBaseViewController {
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .systemPink
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .heavy)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Start"
    }
}

extension StartChallengeViewController {
    override func addViews() {
        super.addViews()
        
        view.setupView(startButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc private func startButtonTapped() {
        let vc = ChallengeViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
