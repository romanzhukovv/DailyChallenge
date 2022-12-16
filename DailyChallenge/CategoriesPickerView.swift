//
//  CategoriesPickerView.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 14.12.2022.
//

import UIKit

final class CategoriesPickerView: DCBaseView {
    
    weak var delegate: CategoriesPickerViewDelegate?
    
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
        collectionView.backgroundColor = Resources.Colors.background
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(CategoryViewCell.self, forCellWithReuseIdentifier: CategoryViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoriesPickerView {
    override func addViews() {
        super.addViews()
        
        setupViews(aboutPickerLabel, collectionView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            aboutPickerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            aboutPickerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            aboutPickerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            collectionView.topAnchor.constraint(equalTo: aboutPickerLabel.bottomAnchor, constant: 30),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -200)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
    }
}

extension CategoriesPickerView: UICollectionViewDelegate, UICollectionViewDataSource {
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
            delegate?.categoriesDidSelect()
            cell?.contentView.backgroundColor = .systemBlue
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let indexes = collectionView.indexPathsForSelectedItems ?? nil
        
        if indexes?.isEmpty ?? false  {
            delegate?.categoriesDidDeselect()
        }
        
        cell?.contentView.backgroundColor = Resources.Colors.accent
    }
}
