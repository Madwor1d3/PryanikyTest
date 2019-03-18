//
//  File.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 12/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import Foundation

struct Object: Decodable {
    
    let objectData: [DictionaryData]
    let objectView: [String]
    
    private enum CodingKeys: String, CodingKey {
        case objectData = "data"
        case objectView = "view"
    }
}
