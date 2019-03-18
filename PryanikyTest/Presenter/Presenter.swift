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
                            if let objectName = self.singleObject?.objectData.first(where: {$0.name == "hz"}), let objectText = objectName.data.text {
                                let hzItem = ModelHzItem(text: objectText)
                                self.items.append(hzItem)
                            }
                        }
                        else if i == "picture" {
                            if let pictureObjectName = self.singleObject?.objectData.first(where: {$0.name == "picture"}), let pictureObjectUrl = self.singleObject?.objectData.first(where: {$0.name == "picture"}), let pictureUrl = pictureObjectUrl.data.url {
                                let pictureItem = ModelPictureItem(text: pictureObjectName.name, pictureUrl: pictureUrl)
                                self.items.append(pictureItem)
                            }
                        }
                        else if i == "selector" {
                            if let objectID = self.singleObject?.objectData.first(where: {$0.name == "selector"}), let objectVariants = self.singleObject?.objectData.first(where: {$0.name == "selector"}), let selectedID = objectID.data.selectedID, let selectedVariants = objectVariants.data.variants {
                                let selectorItem = ModelSelectorItem(selectedID: selectedID, variants: selectedVariants)
                                self.items.append(selectorItem)
                                
                                print(selectedVariants[0].text)
                                print(selectedVariants[1].text)
                                print(selectedVariants[2].text)
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
