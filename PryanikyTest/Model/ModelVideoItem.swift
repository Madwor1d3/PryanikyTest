//
//  ModelVideoItem.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 29/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import Foundation

class ModelVideoItem: ModelItem {
    
    var type: ModelItemType {
        return .video
    }
    
    var sectionTitle: String {
        return "Video"
    }
    
    var text: String
    var coverUrl: String
    var mediaUrl: String
    
    init(text: String, coverUrl: String, mediaUrl: String) {
        self.text = text
        self.coverUrl = coverUrl
        self.mediaUrl = mediaUrl
    }
}
