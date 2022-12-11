//
//  FirstPageViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 03.12.2022.
//

import UIKit

final class FirstPageViewController: DCBaseViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension FirstPageViewController {
    
    override func addViews() {
        super.addViews()
        
        view.setupViews(helloLabel, overviewLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            helloLabel.heightAnchor.constraint(equalToConstant: 96),
            helloLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            overviewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            overviewLabel.heightAnchor.constraint(equalToConstant: 60),
            overviewLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 13)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
    }
}
