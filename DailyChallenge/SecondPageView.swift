//
//  SecondPageView.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 14.12.2022.
//

import UIKit

final class SecondPageView: DCBaseView {
    
    private let descriptionAppLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.Onboarding.description
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
}

extension SecondPageView {
    override func addViews() {
        super.addViews()
        
        setupViews(descriptionAppLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            descriptionAppLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionAppLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionAppLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}
