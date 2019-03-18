//
//  PictureCell.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 15/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit
import Kingfisher



class PictureCell: UITableViewCell {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var pictureImage: UIImageView!
    
    var item: ModelItem? {
        didSet {
            guard let item = item as? ModelPictureItem  else {
                return
            }
            labelText.text = item.text
            pictureImage.kf.setImage(with: URL(string: item.pictureUrl))
        }
    }
}
