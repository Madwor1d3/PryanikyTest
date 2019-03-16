//
//  HzCell.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 15/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit

class HzCell: UITableViewCell {
    
    @IBOutlet weak var labelText: UILabel!
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ModelHzItem  else {
                return
            }
            labelText.text = item.text
        }
    }  
}
