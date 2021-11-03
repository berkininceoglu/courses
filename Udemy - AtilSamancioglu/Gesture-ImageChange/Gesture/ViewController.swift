//
//  ViewController.swift
//  Gesture
//
//  Created by Berkin İnceoğlu on 11/8/19.
//  Copyright © 2019 Berkin İnceoğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer (target: self, action: #selector (changePic))
        img.addGestureRecognizer(gestureRecognizer)
        // Do any additional setup after loading the view, typically from a nib.
    }


    @objc func changePic(){
        
        if(img.image == UIImage(named: "james")){
        img.image = UIImage(named: "lars")
        }
        else{
        img.image = UIImage(named: "james")
        }
        
    }
}

