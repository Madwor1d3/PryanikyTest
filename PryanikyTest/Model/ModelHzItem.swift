//
//  ModelHzItem.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 16/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import Foundation

class ModelHzItem: ModelItem {
    
    var type: ModelItemType {
        return .hz
    }
    
    var sectionTitle: String {
        return "Hz"
    }
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
}
