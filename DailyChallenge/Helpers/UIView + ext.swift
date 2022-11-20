//
//  UIView + ext.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 20.11.2022.
//

import UIKit

extension UIView {
    func setupView(_ view: UIView) {
        addSubview(view)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
