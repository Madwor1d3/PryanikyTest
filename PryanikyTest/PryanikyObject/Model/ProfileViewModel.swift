//
//  ProfileViewModel.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 16/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import Foundation


class ProfileViewModel {
    
    private let jsonUrlString = "https://prnk.blob.core.windows.net/tmp/JSONSample.json"
    
    var items = [ProfileViewModelItem]()
    var singleObject: Object?
    
    func jsonParsing() {
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                self.singleObject = try JSONDecoder().decode(Object.self, from: data)
                DispatchQueue.main.async {
                    //self.tableView.reloadData()
                    
                    if let name = self.singleObject?.objectData[0].data.text {
                        let hzItem = ModelHzItem(text: name)
                        self.items.append(hzItem)
                    }
                    
                    if let nameTwo = self.singleObject?.objectData[1].data.text, let pictureUrl = self.singleObject?.objectData[1].data.url {
                        let pictureItem = ModelPictureItem(text: nameTwo, pictureUrl: pictureUrl)
                        self.items.append(pictureItem)
                    }
                    if let ID = self.singleObject?.objectData[2].data.selectedID, let variants = self.singleObject?.objectData[2].data.variants {
                        let selectorItem = ModelSelectorItem(selectedID: ID, variants: variants)
                        self.items.append(selectorItem)
                    }
                }
            } catch {
                print("Error serializing json:", error)
            }
            } .resume()
    }
}
