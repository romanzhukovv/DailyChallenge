//
//  CategoriesPickerViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 24.11.2022.
//

import UIKit

final class CategoriesPickerViewController: DCBaseViewController {
    
    private let aboutPickerLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose 5 categories:"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    private let continueButton: UIButton = {
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
        
        collectionView.register(CategoryViewCell.self, forCellWithReuseIdentifier: CategoryViewCell.reuseId)
    }
}

extension CategoriesPickerViewController {
    override func addViews() {
        super.addViews()
        view.setupView(aboutPickerLabel)
        view.setupView(collectionView)
        view.setupView(continueButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            aboutPickerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            aboutPickerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutPickerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            collectionView.topAnchor.constraint(equalTo: aboutPickerLabel.bottomAnchor, constant: 30),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            continueButton.widthAnchor.constraint(equalToConstant: 200),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
//        view.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
        
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        continueButton.isHidden = true
    }
    
    @objc func continueButtonTapped() {
        let tapBarVC = TabBarController()
//        navigationController?.pushViewController(tapBarVC, animated: true)
        tapBarVC.modalPresentationStyle = .fullScreen
        self.present(tapBarVC, animated: true, completion: nil)
    }
}

extension CategoriesPickerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryViewCell.reuseId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        if ((cell?.isSelected) != nil) {
            continueButton.isHidden = false
            cell?.contentView.backgroundColor = .systemBlue
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        let indexes = collectionView.indexPathsForSelectedItems ?? nil
        
        if indexes?.isEmpty ?? false  {
            continueButton.isHidden = true
        }
        
        cell?.contentView.backgroundColor = .systemPink
    }

}
