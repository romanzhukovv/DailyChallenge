//
//  StartChallengeViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 27.11.2022.
//

import UIKit

final class StartChallengeViewController: DCBaseViewController<StartChallengeView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Start"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        rootView.startButtonAction(self, with: #selector(startButtonTapped), for: .touchUpInside)
    }
}

extension StartChallengeViewController {
    @objc private func startButtonTapped() {
        let vc = ChallengeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
