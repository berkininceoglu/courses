//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billTextFiled: UITextField!
    @IBOutlet weak var splitField: UILabel!
    
    var tip : Int = 0
    
    @IBAction func zeroTipPressed(_ sender: UIButton) {
        setTipValue(p: 0)
    }
    @IBAction func tenTipPressed(_ sender: UIButton) {
        setTipValue(p: 10)
    }
    @IBAction func twentyTipPressed(_ sender: Any) {
        setTipValue(p: 20)
    }
    
    @IBAction func splitCountChanged(_ sender: UIStepper) {
        let splitCount = Int(sender.value)
        splitField.text = "\(splitCount)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setTipValue(p percentage: Int) {
        tip = percentage
        print(tip)
    }

}

