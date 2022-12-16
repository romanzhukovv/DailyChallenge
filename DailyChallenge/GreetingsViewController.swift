//
//  ViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 20.11.2022.
//

import UIKit

protocol GreetingsViewDelegate: AnyObject {
    func nameDidChange(nameTextCount: Int)
}

class GreetingsViewController: DCBaseViewController<GreetingsView> {
    
    weak var delegate: GreetingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.delegate = self
    }
}

extension GreetingsViewController: GreetingsViewDelegate {
    func nameDidChange(nameTextCount: Int) {
        delegate?.nameDidEnter(nameTextCount: nameTextCount)
    }
}
