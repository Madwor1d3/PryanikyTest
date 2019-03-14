//
//  DataContainer.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 12/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import Foundation

struct DataContainer: Decodable {
    
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [SelectorVariantsData]?
    
    enum CodingKeys: String, CodingKey {
        case text, url
        case selectedID = "selectedId"
        case variants
    }
}
