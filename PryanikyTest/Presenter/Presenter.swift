//
//  Presenter.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 16/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import Foundation

class Presenter {
    //    private let jsonUrlString = "https://chat.pryaniky.com/json/data-4.json"
    //    private let jsonUrlString = "https://prnk.blob.core.windows.net/tmp/JSONSample.json"
    private let jsonUrlString = "https://chat.pryaniky.com/json/data-1c.json"
    
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
                let sequenceArray = self.singleObject.objectView
                for i in sequenceArray {
                    if i == "hz" {
                        if let objectName = self.singleObject?.objectData.filter({ return $0.name == "hz"}).map({$0.data.text}) {
                            for objectText in objectName {
                                let hzItem = ModelHzItem(text: objectText ?? "")
                                self.items.append(hzItem)
                            }
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
                        }
                    }
                    else if i == "audio" {
                        if let audioObjectName = self.singleObject?.objectData.first(where: {$0.name == "audio"}), let audioObjectCoverUrl = self.singleObject?.objectData.first(where: {$0.name == "audio"}), let audioObjectMediaUrl = self.singleObject?.objectData.first(where: {$0.name == "audio"}), let audioCoverUrl = audioObjectCoverUrl.data.coverURL, let audioMediaUrl = audioObjectMediaUrl.data.mediaURL, let audioText = audioObjectName.data.text {
                            let audioItem = ModelMediaItem(text: audioText, coverUrl: audioCoverUrl, mediaUrl: audioMediaUrl)
                            self.items.append(audioItem)
                        }
                    }
                    else if i == "video" {
                        if let videoObjectName = self.singleObject?.objectData.first(where: {$0.name == "video"}), let videoObjectCoverUrl = self.singleObject?.objectData.first(where: {$0.name == "video"}), let videoObjectMediaUrl = self.singleObject?.objectData.first(where: {$0.name == "video"}), let videoCoverUrl = videoObjectCoverUrl.data.coverURL, let videoMediaUrl = videoObjectMediaUrl.data.mediaURL, let videoText = videoObjectName.data.text {
                            let videoItem = ModelMediaItem(text: videoText, coverUrl: videoCoverUrl, mediaUrl: videoMediaUrl)
                            self.items.append(videoItem)
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
