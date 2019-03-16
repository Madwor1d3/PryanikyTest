//
//  ViewController.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 11/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit

class PryanikyObjectView: UIViewController {
    
    private let jsonUrlString = "https://prnk.blob.core.windows.net/tmp/JSONSample.json"
    private var singleObject: Object?

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsing()
        tableView.tableFooterView = UIView()
    }


    
    func jsonParsing() {
        
        guard let url = URL(string: jsonUrlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, err) in

            guard let data = data else { return }

            do {
                self.singleObject = try JSONDecoder().decode(Object.self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            }.resume()

    }
}


extension PryanikyObjectView: UITableViewDelegate {
}

extension PryanikyObjectView: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singleObject?.objectView.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cellModel = customElements[indexPath.row]
        let cellIdentifier = cellModel.type.rawValue
        let customCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomElementCell
        
        customCell.configure(withModel: cellModel)
        
        return customCell as! UITableViewCell
    }

        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HzCell
//
//        let type = CustomElementType(rawValue: singleObject?.objectView[indexPath.row] ?? "")
//        let object = singleObject?.objectView.first(where: { $0 == type?.rawValue})
//        cell?.dataLabel.text = object
//
//        return cell!
//    }
    
}


