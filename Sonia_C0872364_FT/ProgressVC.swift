//
//  ProgressVC.swift
//  Sonia_C0872364_FT
//
//  Created by MacStudent on 2022-11-07.
//

import UIKit

class ProgressVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: ViewController?
    var progressData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        progressData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        cell.textLabel?.text = progressData[indexPath.row]
        
        return cell
    }
    

}
