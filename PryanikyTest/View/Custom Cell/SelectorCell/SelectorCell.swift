//
//  SelectorCell.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 15/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit

protocol SelectorCellDelegate: class {
    func showAlert(called by: Int)
}

class SelectorCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var selector: UIPickerView!
    
    weak var delegate: SelectorCellDelegate?
    
    var item: ModelSelectorItem? {
        didSet {
            guard let item = item else { return }
            configure(with: item)
        }
    }
    
    func configure(with item: ModelSelectorItem) {
        let preSelectedRow = item.selectedID
        selector.delegate = self
        selector.dataSource = self
        selector.selectRow(preSelectedRow, inComponent: 0, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return item?.variants.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return item?.variants[row].text
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.delegate?.showAlert(called: item?.variants[row].id ?? 0)
    }
}

