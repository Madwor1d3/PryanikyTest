//
//  SelectorCell.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 15/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit

class SelectorCell: UITableViewCell {
    
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
    }
}
