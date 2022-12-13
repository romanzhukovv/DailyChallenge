//
//  UIViewController+ext.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 13.12.2022.
//

import UIKit

protocol HasCustomView {
    associatedtype CustomView: UIView
}

extension HasCustomView where Self: UIViewController {
    var rootView: CustomView {
        guard let view = view as? CustomView
        else {
            fatalError("Expected view to be of type \(CustomView.self) but got \(type(of: view)) instead")
        }
        return view
    }
}
