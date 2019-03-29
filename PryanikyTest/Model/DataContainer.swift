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
    let coverURL: String?
    let mediaURL: String?
    let selectedID: Int?
    let variants: [SelectorVariantsData]?
    
    enum CodingKeys: String, CodingKey {
        case text, url
        case coverURL = "coverUrl"
        case mediaURL = "mediaUrl"
        case selectedID = "selectedId"
        case variants
    }
}
