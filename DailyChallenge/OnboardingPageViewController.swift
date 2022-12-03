//
//  OnboardingPageViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 03.12.2022.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {
    
    private var pages: [UIViewController] = []
    private let initialPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        let page1 = FirstPageViewController()
        let page2 = SecondPageViewController()
        let page3 = GreetingsViewController()
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
}

extension OnboardingPageViewController {
    
}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vc = viewController as? DCBaseViewController else { return nil}
        guard let currentIndex = pages.firstIndex(of: vc) else { return nil }
        
        if currentIndex > 0 {
            return pages[currentIndex - 1]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vc = viewController as? DCBaseViewController else { return nil}
        guard let currentIndex = pages.firstIndex(of: vc) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return nil
        }
    }
}

extension OnboardingPageViewController: UIPageViewControllerDelegate {
    
}
