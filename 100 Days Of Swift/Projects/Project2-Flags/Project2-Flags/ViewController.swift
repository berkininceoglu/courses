//
//  ViewController.swift
//  Project2-Flags
//
//  Created by Berkin İnceoğlu on 1.10.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var flag1: UIButton!
    @IBOutlet weak var flag2: UIButton!
    @IBOutlet weak var flag3: UIButton!
    
    var countries = [String]()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
countries += ["estonia", "france", "germany", "italy", "ireland", "monaco", "nigeria", "poland", "russia", "uk", "us"]
        
        askQuestion()
        
        flag1.layer.borderWidth = 1
        flag2.layer.borderWidth = 1
        flag3.layer.borderWidth = 1
        
        flag1.layer.borderColor = UIColor.lightGray.cgColor
        flag2.layer.borderColor = UIColor.lightGray.cgColor
        flag3.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    func askQuestion(){
        flag1.setImage(UIImage(named: countries[0]), for: .normal)
        
        flag2.setImage(UIImage(named: countries[1]), for: .normal)
        
        flag3.setImage(UIImage(named: countries[2]), for: .normal)
    }

}

