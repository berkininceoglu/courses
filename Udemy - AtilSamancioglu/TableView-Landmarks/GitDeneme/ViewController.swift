//
//  ViewController.swift
//  GitDeneme
//
//  Created by Berkin İnceoğlu on 11/11/19.
//  Copyright © 2019 Berkin İnceoğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
       var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
     
        landmarkNames.append("Denizli Kebabi")
        landmarkNames.append("Teleferik")
        landmarkNames.append("Garson Sukru")
        landmarkNames.append("Pamukkale")
        
        
        
        landmarkImages.append(UIImage(named: "cartman.jpg")!)
        landmarkImages.append(UIImage(named: "cartman.jpg")!)
        landmarkImages.append(UIImage(named: "cartman.jpg")!)
        landmarkImages.append(UIImage(named: "cartman.jpg")!)
        
        navigationItem.title = "Denizli where amazing happens."

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toImageViewController")
        {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell ()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count;
    }


}

