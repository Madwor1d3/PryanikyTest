//
//  VideoCell.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 29/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Kingfisher

class VideoCell: UITableViewCell {
    
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoText: UILabel!
    
    var item: ModelItem? {
        didSet {
            guard let item = item as? ModelVideoItem  else {
                return
            }
            videoText.text = item.text
            videoImage.kf.setImage(with: URL(string: item.coverUrl))
        }
    }
    
    @IBAction func playVideoButtonPressed(_ sender: UIButton) {
    }
}

