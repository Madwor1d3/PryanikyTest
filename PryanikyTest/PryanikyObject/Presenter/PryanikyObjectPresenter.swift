//
//  MainViewPresenter.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 11/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import Foundation

class PryanikyObjectPresenter {
    
    private let jsonUrlString = "https://prnk.blob.core.windows.net/tmp/JSONSample.json"
    var sharedData = [DictionaryData]()
    
    init() {}
    
    func jsonParsing() {
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url)
        {(data, response, error) in
            
            guard let data = data else { return }
            do {
                let objectData = try JSONDecoder().decode(DictionaryData.self, from: data)
                print(objectData)
                
//                print(objectData.objectData)
            } catch let jsonErr {
                print("Error serilaizing json:", jsonErr)
            }
            } .resume()
    }
    
}

