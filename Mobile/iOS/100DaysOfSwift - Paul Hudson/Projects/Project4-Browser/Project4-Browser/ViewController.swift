//
//  ViewController.swift
//  Project4-Browser
//
//  Created by Berkin İnceoğlu on 11.10.2021.
//

import UIKit

class ViewController: UITableViewController {
    
    var webSites = ["apple.com", "hackingwithswift.com", "transfermarkt.com.tr"]
    var safeSites = ["apple.com", "hackingwithswift.com"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webSites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Site", for: indexPath)
        cell.textLabel?.text = webSites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        vc.webSites = webSites
        vc.safeSites = safeSites
        vc.currentWebsite = indexPath.row
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

