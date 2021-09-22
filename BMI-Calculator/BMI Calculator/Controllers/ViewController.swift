//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightSlider: UIStackView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightSlider: UIStackView!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        if(sender.tag == 1){
            heightLabel.text = NSString(format: "%.2f", sender.value) as String
        }else{
            weightLabel.text = NSString(format: "%.0f", sender.value) as String
        }
    }
    
}

