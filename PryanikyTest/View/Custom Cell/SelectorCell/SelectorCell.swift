//
//  SelectorCell.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 15/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit

class SelectorCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var selector: UIPickerView!

    var item: ModelItem? {
        didSet {
            guard let item = item as? ModelSelectorItem  else {
                return
            }
            configure(with: item)
        }
    }
    
    func configure(with item: ModelSelectorItem) {
        
        selector.delegate = self
        selector.dataSource = self
        }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return item?.rowCount ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return item?.
    }
    
    }
