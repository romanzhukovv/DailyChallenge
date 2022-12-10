//
//  ProgressViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 27.11.2022.
//

import UIKit

final class ProgressViewController: DCBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Progress"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
