//
//  CategoriesPickerViewController.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 24.11.2022.
//

import UIKit

protocol CategoriesPickerViewDelegate: AnyObject {
    func categoriesDidSelect()
    func categoriesDidDeselect()
}

final class CategoriesPickerViewController: DCBaseViewController<CategoriesPickerView> {
    
    weak var delegate: CategoriesPickerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.delegate = self
    }
}

extension CategoriesPickerViewController: CategoriesPickerViewDelegate {
    func categoriesDidSelect() {
        delegate?.categoriesDidSelect()
    }
    
    func categoriesDidDeselect() {
        delegate?.categoriesDidDeselect()
    }
}
