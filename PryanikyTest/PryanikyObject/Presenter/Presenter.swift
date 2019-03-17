//
//  Presenter.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 16/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import Foundation

class Presenter {

    private let jsonUrlString = "https://prnk.blob.core.windows.net/tmp/JSONSample.json"
    
    var items = [ModelItem]()
    var singleObject: Object!
    
    func jsonParsing(completionHandler: @escaping (([ModelItem], Error?) -> Void)) {
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data else { DispatchQueue.main.async {completionHandler([], error)}
                return
            }

            do {
                self.singleObject = try JSONDecoder().decode(Object.self, from: data)
                DispatchQueue.main.async {
 
                let sequenceArray = self.singleObject.objectView
                    for i in sequenceArray {
                        if i == "hz" {
                            if let hzObjectName = self.singleObject?.objectData.first(where: {$0.name == "hz"}) {
                                let hzItem = ModelHzItem(text: hzObjectName.name)
                                self.items.append(hzItem)
                            }
                        }
                        else if i == "picture" {
                            if let pictureObjectName = self.singleObject?.objectData.first(where: {$0.name == "picture"}), let pictureUrl = self.singleObject?.objectData.first(where: {$0.name == "picture"}) {
                                let pictureItem = ModelPictureItem(text: pictureObjectName.name, pictureUrl: pictureUrl.data.url ?? "")
                                self.items.append(pictureItem)
                            }
                        }
                        else if i == "selector" {
                            if let ID = self.singleObject?.objectData[2].data.selectedID, let variants = self.singleObject?.objectData[2].data.variants {
                                let selectorItem = ModelSelectorItem(selectedID: ID, variants: variants)
                                self.items.append(selectorItem)
                            }
                        }
                    }
                }
                DispatchQueue.main.async {completionHandler(self.items, nil)}
            } catch {
                print("Error serializing json:", error)
            }
            } .resume()
    }
}
