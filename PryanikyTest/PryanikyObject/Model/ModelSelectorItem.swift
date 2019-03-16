//
//  ModelSelectorItem.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 16/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import Foundation

class ModelSelectorItem: ProfileViewModelItem {
    var type: ModelItemType {
        return .selector
    }
    var sectionTitle: String {
        return "selector section"
    }
    var selectedID: Int
    var variants: [SelectorVariantsData]
    
    init(selectedID: Int, variants: [SelectorVariantsData]) {
        self.selectedID = selectedID
        self.variants = variants
    }
}
