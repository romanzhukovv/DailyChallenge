//
//  OnboardingPageViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 03.12.2022.
//

import UIKit

protocol GreetingsViewControllerDelegate {
    func nameDidEnter(nameTextCount: Int)
}

protocol CategoriesPickerViewControllerDelegate {
    func categoriesDidSelect()
    func categoriesDidDeselect()
}

class OnboardingPageViewController: UIPageViewController {
    
    private var pages: [UIViewController] = []
    private var initialPage = 0
    private var barProgress: Float = 0.0
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .systemPink
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .heavy)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let onboardingProgressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.tintColor = .systemPink
        progressView.trackTintColor = .white
        return progressView
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
        page4.delegate = self
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        
        view.setupView(nextButton)
        view.setupView(onboardingProgressView)
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            
            onboardingProgressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingProgressView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            onboardingProgressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            onboardingProgressView.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        onboardingProgressView.setProgress(barProgress, animated: true)
    }
}

@objc extension OnboardingPageViewController {
    func nextButtonTapped() {
        
        if initialPage < pages.count - 1 {
            initialPage += 1
            nextButton.isHidden = initialPage > 1 ? true : false
            setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
            barProgress += 0.25
            onboardingProgressView.setProgress(barProgress, animated: true)
        } else {
            onboardingProgressView.setProgress(1.0, animated: true)
            let tapBarVC = TabBarController()
            tapBarVC.modalPresentationStyle = .fullScreen
            self.present(tapBarVC, animated: true, completion: nil)
        }
    }
}

extension OnboardingPageViewController: GreetingsViewControllerDelegate {
    func nameDidEnter(nameTextCount: Int) {
        nextButton.isHidden = nameTextCount > 0 ? false : true
    }
}

extension OnboardingPageViewController: CategoriesPickerViewControllerDelegate {
    func categoriesDidDeselect() {
        nextButton.isHidden = true
    }
    
    func categoriesDidSelect() {
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
