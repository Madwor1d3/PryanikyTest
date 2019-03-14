//
//  ResponseCellTableViewCell.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 11/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var dataImageView: UIImageView!
    
    func configureLabel(with text: DictionaryData) {
        self.dataLabel.text = text.name
    }

    func configureImageView(with image: DataContainer) {
        
        let url = URL(string: image.url!)
        if let data = try? Data(contentsOf: url!)
        {
            dataImageView.image = UIImage(data: data)
        }
    }
}
