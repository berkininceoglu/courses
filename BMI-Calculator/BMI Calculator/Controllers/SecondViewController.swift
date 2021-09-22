//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Berkin İnceoğlu on 22.09.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit //uikit already has foundation attributes

class SecondViewController: UIViewController {
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red //swift already knows that it is uicolor
        
        let label = UILabel()
        label.text = bmiValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        view.addSubview(label)
    }
}
