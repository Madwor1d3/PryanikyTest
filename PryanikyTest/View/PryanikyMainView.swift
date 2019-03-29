//
//  ViewController.swift
//  PryanikyTest
//
//  Created by Madwor1d3 on 11/03/2019.
//  Copyright © 2019 Madwor1d3. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PryanikyMainView: UIViewController, SelectorCellDelegate, MediaLaunching{

    var presenter = Presenter()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        cellRegister()
        presenter.jsonParsing { [weak self] items, error in
            self?.tableView.reloadData()
        }
    }
    
    func showMediaPlayer(url: URL) {
        
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player
        present(controller, animated: true) {
            player.play()
        }
    }
    
    func showAlert<T>(called by: T) {
        let titleText = "Данное событие инициировано объектом \nid - \(by)"
        let alert = UIAlertController(title: titleText, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func cellRegister() {
        let hzCellName = UINib(nibName: "HzCell", bundle: Bundle.main)
        tableView.register(hzCellName, forCellReuseIdentifier: "HzCell")
        let pictureCellName = UINib(nibName: "PictureCell", bundle: Bundle.main)
        tableView.register(pictureCellName, forCellReuseIdentifier: "PictureCell")
        let selectorCellName = UINib(nibName: "SelectorCell", bundle: Bundle.main)
        tableView.register(selectorCellName, forCellReuseIdentifier: "SelectorCell")
        let mediaCellName = UINib(nibName: "MediaCell", bundle: Bundle.main)
        tableView.register(mediaCellName, forCellReuseIdentifier: "MediaCell")
    }
}


extension PryanikyMainView: UITableViewDelegate {
}

extension PryanikyMainView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter.items[indexPath.section]
        switch item.type {
        case .hz:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HzCell",for: indexPath) as? HzCell {
                cell.item = item
                return cell
            }
        case .picture:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath) as? PictureCell {
                cell.item = item
                return cell
            }
        case .selector:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SelectorCell", for: indexPath) as? SelectorCell {
                cell.item = item as? ModelSelectorItem
                cell.delegate = self
                return cell
            }
        case .media:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as? MediaCell {
                cell.item = item as? ModelMediaItem
                cell.delegate = self
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.items[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let textValue = presenter.items[indexPath.section].type.rawValue
        showAlert(called: textValue)
    }
}
