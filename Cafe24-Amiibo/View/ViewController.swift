//
//  ViewController.swift
//  Cafe24-Amiibo
//
//  Created by Jeff Umandap on 5/17/21.
//

import Foundation
import UIKit
import WebKit

protocol ViewControllerDelegate: class {
    func imageViewTapped(data: Character)
    func nameTapped(data: Character)
}

class ViewController: UIViewController, ViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let parser = Parser()
    var character = [Character]()
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parser.parse { (char) in
            self.character = char
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func imageViewTapped(data: Character) {
        let view =  CharacterImageViewController()
        view.character = data
        view.parser = parser
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .coverVertical
        self.present(view, animated: true, completion: nil)
    }
    
    func nameTapped(data: Character) {
        let view = SearchOnGoogleViewController()
        view.character = data
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .coverVertical
        self.present(view, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as? CharacterCell {
            let char = character[indexPath.row]
            cell.nameLabel.text = char.name
            cell.seriesLabel.text = char.gameSeries
            cell.characterImage.imageFromServerURL(urlString: char.image)
            cell.vcDelegate = self
            cell.data = char
            return cell
        }
        return UITableViewCell()
    }
}
