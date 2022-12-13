//
//  DCBaseViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 20.11.2022.
//

import UIKit

class DCBaseViewController<CustomView: UIView>: UIViewController, HasCustomView {
    typealias CustomView = CustomView
    
    override func loadView() {
        let rootView = CustomView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addViews()
//        layoutViews()
//        configureViews()
    }
}

//@objc extension DCBaseViewController {
//    func addViews() {
//
//    }
//
//    func layoutViews() {
//
//    }
//
//    func configureViews() {
//        view.backgroundColor = Resources.Colors.background
//    }
//}
