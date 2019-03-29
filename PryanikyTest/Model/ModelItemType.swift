//
//  DisplaySequence.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 14/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import Foundation

enum ModelItemType: String {
    
    case hz
    case picture
    case selector
    case audio
    case video
}

protocol ModelItem {
    
    var type: ModelItemType { get }
    var sectionTitle: String  { get }
}

extension ModelItem {
    
    var rowCount: Int {
        return 1
    }
}
