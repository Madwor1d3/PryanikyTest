//
//  ModelSelectorItem.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 16/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import Foundation

class ModelSelectorItem: ModelItem {
    var type: ModelItemType {
        return .selector
    }
    var sectionTitle: String {
        return "selector section"
    }
    
    var rowCount: Int {
        return variants.count
    }
    
    var selectedID: Int
    var variants: [SelectorVariantsData]
//    var variantsID: Int
//    var variantsText: String
//    
    init(selectedID: Int, variants: [SelectorVariantsData]) {
        self.selectedID = selectedID
        self.variants = variants
    }
    
//    init(variantsID: Int, variantsText: String) {
//        self.variantsID = variantsID
//        self.variantsText = variantsText
//    }
}
