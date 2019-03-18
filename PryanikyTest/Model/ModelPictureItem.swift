//
//  ModelPictureItem.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 16/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import Foundation

class ModelPictureItem: ModelItem {
    var type: ModelItemType {
        return .picture
    }
    var sectionTitle: String {
        return "picture section"
    }
    var text: String
    var pictureUrl: String
    
    init(text: String, pictureUrl: String) {
        self.text = text
        self.pictureUrl = pictureUrl

    }
}
