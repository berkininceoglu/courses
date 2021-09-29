//
//  ViewController.swift
//  Project1-Storm Viewer
//
//  Created by Berkin İnceoğlu on 29.09.2021.
//

import UIKit

class ViewController: UIViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
            
        }
        
        print(pictures)
    }


}

