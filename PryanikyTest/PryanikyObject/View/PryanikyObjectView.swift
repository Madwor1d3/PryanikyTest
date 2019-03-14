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
    private var singleObject = Object()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsing()
    }

    
    func jsonParsing() {
        
        guard let url = URL(string: jsonUrlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, err) in

            guard let data = data else { return }

            do {

                let jsonObj = try JSONDecoder().decode(Object.self, from: data)

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

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    }
    
}

