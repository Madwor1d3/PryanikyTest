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

protocol MediaLaunching: class {
    func showMediaPlayer(url: URL)
}

class MediaCell: UITableViewCell {
    
    private var mediaUrl = ""
    private var player: AVPlayer!
    weak var delegate: MediaLaunching?
    
    @IBOutlet weak var mediaImage: UIImageView!
    @IBOutlet weak var mediaText: UILabel!
    
    var item: ModelItem? {
        didSet {
            guard let item = item as? ModelMediaItem  else {
                return
            }
            mediaText.text = item.text
            mediaImage.kf.setImage(with: URL(string: item.coverUrl))
            mediaUrl = item.mediaUrl
        }
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        playMediaFile(fileUrl: mediaUrl)
    }
    
    func playMediaFile(fileUrl: String) {
        
        guard let url = URL(string: fileUrl) else {
            return
        }
        delegate?.showMediaPlayer(url: url)
    }
}

