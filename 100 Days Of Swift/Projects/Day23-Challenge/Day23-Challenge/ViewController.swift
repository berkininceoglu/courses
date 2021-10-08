//
//  ViewController.swift
//  Day23-Challenge
//
//  Created by Berkin İnceoğlu on 8.10.2021.
//

import UIKit

class TableViewController: UITableViewController {
    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flags += ["estonia", "france", "germany", "italy", "ireland", "monaco", "nigeria", "poland", "russia", "uk", "us"]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return flags.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Image", for: indexPath)
            cell.textLabel?.text = flags[indexPath.row]
            cell.imageView?.image = UIImage(named: flags[indexPath.row])
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Flag") as? FlagViewController{
                vc.selectedImage = flags[indexPath.row]
                navigationController?.pushViewController(vc, animated: true)
            }
           
        }


}

