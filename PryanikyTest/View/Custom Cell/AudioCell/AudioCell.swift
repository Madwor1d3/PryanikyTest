//
//  AudioCell.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 29/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Kingfisher

class AudioCell: UITableViewCell {

    @IBOutlet weak var audioImage: UIImageView!
    @IBOutlet weak var audioText: UILabel!
    
    var item: ModelItem? {
        didSet {
            guard let item = item as? ModelAudioItem  else {
                return
            }
            audioText.text = item.text
            audioImage.kf.setImage(with: URL(string: item.coverUrl))
        }
    }
    
    @IBAction func playSoundButtonPressed(_ sender: UIButton) {
    }
}
