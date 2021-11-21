//
//  ViewController.swift
//  Project1-Storm Viewer
//
//  Created by Berkin İnceoğlu on 29.09.2021.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "StormViewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareApp))

        performSelector(inBackground: #selector(loadPictures), with: nil)
    }
    
    @objc func loadPictures() {
        let fm = FileManager.default
        
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures.sort()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
        
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? //next line is for exception breakpoint
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Bad") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            vc.orderCount = indexPath.row
            vc.totalCount = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
       
    }
    
    @objc func shareApp() {
        guard let name = URL(string: "https://apps.apple.com/tr/app/whatsapp-messenger/id310633997")
        else{
            print("App could not be found!")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [name], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}

