//
//  ViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 20.11.2022.
//

import UIKit

protocol GreetingsViewDelegate {
    func nameDidChange(nameTextCount: Int)
}

class GreetingsViewController: DCBaseViewController<GreetingsView> {
    
    var delegate: GreetingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension GreetingsViewController: GreetingsViewDelegate {
    func nameDidChange(nameTextCount: Int) {
        delegate?.nameDidEnter(nameTextCount: nameTextCount)
    }
}

@objc extension GreetingsViewController {
    func keyboardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 70
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
