//
//  ViewController.swift
//  Day50-Challenge
//
//  Created by Berkin İnceoğlu on 4.11.2021.
//

import UIKit

class ViewController: UITableViewController {
    let pictures = ["A", "B", "C"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }


}

