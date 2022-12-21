//
//  TabBarController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 27.11.2022.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = Resources.Colors.accent
        tabBar.unselectedItemTintColor = .white
        
        let vc1 = UINavigationController(rootViewController: StartChallengeViewController())
        let vc2 = UINavigationController(rootViewController: ProgressViewController())

        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "bell")

        vc1.tabBarItem.title = "Start"
        vc2.tabBarItem.title = "Progress"

        viewControllers = [vc1, vc2]

        navigationItem.hidesBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if StorageManager.shared.getOnboardingStatus() == false {
            let pageVC = OnboardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
//            pageVC.isModalInPresentation = true
            pageVC.modalPresentationStyle = .fullScreen
            present(pageVC, animated: false)
        }
    }
}
