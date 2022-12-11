//
//  SeecondPageViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 03.12.2022.
//

import UIKit

final class SecondPageViewController: DCBaseViewController {
    
    private let descriptionAppLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Onboarding.description
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
}

extension SecondPageViewController {
    override func addViews() {
        super.addViews()
        
        view.setupView(descriptionAppLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            descriptionAppLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionAppLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            descriptionAppLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
}
