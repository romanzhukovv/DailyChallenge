//
//  OnboardingPageViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 03.12.2022.
//

import UIKit

protocol GreetingsViewControllerDelegate: AnyObject {
    func nameDidEnter(nameTextCount: Int)
}

protocol CategoriesPickerViewControllerDelegate: AnyObject {
    func categoriesDidSelect()
    func categoriesDidDeselect()
}

class OnboardingPageViewController: UIPageViewController {
    
    private var pages: [UIViewController] = []
    private var initialPage = 0
    private var barProgress: Float = 0.0
    
    private let onboardingProgressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.tintColor = Resources.Colors.accent
        progressView.trackTintColor = .white
        return progressView
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(Resources.Images.nextButton, for: .normal)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 12
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        view.setupViews(stackView)
        stackView.addArrangedSubview(onboardingProgressView)
        stackView.addArrangedSubview(nextButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            onboardingProgressView.heightAnchor.constraint(equalToConstant: 3),
            
        ])
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        onboardingProgressView.setProgress(barProgress, animated: true)
    }
}

@objc extension OnboardingPageViewController {
    func nextButtonTapped() {
        if initialPage < pages.count - 1 {
            initialPage += 1
            setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
            
            nextButton.isEnabled = initialPage > 1 ? false : true
            
            barProgress += 0.25
            onboardingProgressView.setProgress(barProgress, animated: true)
        } else {
            onboardingProgressView.setProgress(1.0, animated: true)
            
//            let tapBarVC = TabBarController()
//            tapBarVC.modalPresentationStyle = .fullScreen
//            pages = []
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
//                self.present(tapBarVC, animated: true, completion: nil)
                self.dismiss(animated: true)
//            }
        }
    }
}

extension OnboardingPageViewController: GreetingsViewControllerDelegate {
    func nameDidEnter(nameTextCount: Int) {
        nextButton.isEnabled = nameTextCount > 0 ? true : false
    }
}

extension OnboardingPageViewController: CategoriesPickerViewControllerDelegate {
    func categoriesDidDeselect() {
        nextButton.isEnabled = false
    }
    
    func categoriesDidSelect() {
        nextButton.isEnabled = true
    }
}
