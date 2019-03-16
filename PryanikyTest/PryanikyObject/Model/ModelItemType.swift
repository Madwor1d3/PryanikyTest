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
}

protocol ProfileViewModelItem {
    var type: ModelItemType { get }
    var rowCount: Int { get }
    var sectionTitle: String  { get }
}

extension ProfileViewModelItem {
    var rowCount: Int {
        return 1
    }
}
