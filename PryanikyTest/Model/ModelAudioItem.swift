//
//  ModelAudioItem.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 29/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import Foundation

class ModelAudioItem: ModelItem {
    
    var type: ModelItemType {
        return .audio
    }
    
    var sectionTitle: String {
        return "Audio"
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
