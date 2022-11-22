//
//  DCBaseView.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 22.11.2022.
//

import UIKit

class DCBaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        layoutViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension DCBaseView {
    func addViews() {
        
    }
    
    func layoutViews() {
        
    }
    
    func configureViews() {
        
    }
}
