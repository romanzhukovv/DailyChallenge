//
//  CategoryViewCell.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 24.11.2022.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {
    static let reuseId = "CategoryViewCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = Resources.Colors.accent
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print(self)
    }
}
