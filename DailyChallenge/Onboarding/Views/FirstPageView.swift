//
//  FirstPageView.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 14.12.2022.
//

import UIKit

final class FirstPageView: DCBaseView {
    
    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать!"
        label.textColor = .white
        label.font = .systemFont(ofSize: 36, weight: .heavy)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Выполняйте ежедневные задачи для улучшения качества жизни."
        label.textColor = .white
        label.font = .systemFont(ofSize: 19, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
}

extension FirstPageView {
    override func addViews() {
        super.addViews()
        
        setupViews(helloLabel, overviewLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            helloLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            helloLabel.heightAnchor.constraint(equalToConstant: 96),
            helloLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            
            overviewLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            overviewLabel.heightAnchor.constraint(equalToConstant: 60),
            overviewLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 13)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
    }
}
