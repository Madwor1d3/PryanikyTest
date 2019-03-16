//
//  ViewController.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 11/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit

class PryanikyViewController: UIViewController {
    
    let some: ProfileViewModel? = nil
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        cellRegister()
    }
    
    func cellRegister() {
        let hzCellName = UINib(nibName: "HzCell", bundle: nil)
        tableView.register(hzCellName, forCellReuseIdentifier: "PictureCell")
        let pictureCellName = UINib(nibName: "PictureCell", bundle: nil)
        tableView.register(pictureCellName, forCellReuseIdentifier: "PictureCell")
        let selectorCellName = UINib(nibName: "SelectorCell", bundle: nil)
        tableView.register(selectorCellName, forCellReuseIdentifier: "SelectorCell")
    }
}

extension PryanikyViewController: UITableViewDelegate {
    
}

extension PryanikyViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return some?.singleObject?.objectView.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = some?.items[indexPath.section]
        switch item?.type {
        case .hz?:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HzCell",for: indexPath) as? HzCell {
                cell.item = item
                return cell
            }
        case .picture?:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath) as? PictureCell {
                cell.item = item
                return cell
            }
            
        case .selector?:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SelectorCell", for: indexPath) as? SelectorCell {
                return cell
            }
        case .none:
            break
        }
        return UITableViewCell()
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch items[indexPath.section].type {
//        }}
    
    
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HzCell
    //
    //        let type = CustomElementType(rawValue: singleObject?.objectView[indexPath.row] ?? "")
    //        let object = singleObject?.objectView.first(where: { $0 == type?.rawValue})
    //        cell?.dataLabel.text = object
    //
    //        return cell!
    //    }
}
