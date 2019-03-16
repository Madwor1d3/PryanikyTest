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

protocol CustomElementModel: class {
    var type: ModelItemType { get }
}

protocol CustomElementCell: class {
    func configure(withModel: CustomElementModel)
}
