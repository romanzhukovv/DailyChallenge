//
//  OnboardingPageViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 03.12.2022.
//

import UIKit

protocol GreetingsViewControllerDelegate {
    func nameDidEnter()
}

class OnboardingPageViewController: UIPageViewController {
    
    private var pages: [UIViewController] = []
    private var initialPage = 0
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .systemPink
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .heavy)
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        dataSource = self
//        delegate = self
        
        let page1 = FirstPageViewController()
        let page2 = SecondPageViewController()
        let page3 = GreetingsViewController()
        let page4 = CategoriesPickerViewController()
        
        page3.delegate = self
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        
        view.setupView(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
}

@objc extension OnboardingPageViewController {
    func nextButtonTapped() {
        print(initialPage)
        
        if initialPage < pages.count - 1 {
            initialPage += 1
            nextButton.isHidden = initialPage > 1 ? true : false
            setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        } else {
            let tapBarVC = TabBarController()
            tapBarVC.modalPresentationStyle = .fullScreen
            self.present(tapBarVC, animated: true, completion: nil)
        }
    }
}

extension OnboardingPageViewController: GreetingsViewControllerDelegate {
    func nameDidEnter() {
//        setViewControllers([pages[pages.count - 1]], direction: .forward, animated: true, completion: nil)
        nextButton.isHidden = false
    }
}

//extension OnboardingPageViewController: UIPageViewControllerDataSource {
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//
//        guard let vc = viewController as? DCBaseViewController else { return nil}
//        guard let currentIndex = pages.firstIndex(of: vc) else { return nil }
//
//        if currentIndex > 0 {
//            return pages[currentIndex - 1]
//        } else {
//            return nil
//        }
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//
//        guard let vc = viewController as? DCBaseViewController else { return nil }
//        guard let currentIndex = pages.firstIndex(of: vc) else { return nil }
//
//        if currentIndex < pages.count - 1 {
//            return pages[currentIndex + 1]
//        } else {
//            return nil
//        }
//    }
//}

//extension OnboardingPageViewController: UIPageViewControllerDelegate {
//
//}
