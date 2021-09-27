//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitField: UILabel!
    
    @IBOutlet weak var zeroPercentField: UIButton!
    @IBOutlet weak var tenPercentField: UIButton!
    @IBOutlet weak var twentyPercentField: UIButton!
    var bill : Double = 0.0
    var splitCount : Int = 2
    var tip : Int = 0
    var sum : Double = 0.0
    
    @IBAction func zeroTipPressed(_ sender: UIButton) {
        clearTipBackgrounds()
        zeroPercentField.isSelected = true
        setTipValue(p: 0)
    }
    @IBAction func tenTipPressed(_ sender: UIButton) {
        clearTipBackgrounds()
        tenPercentField.isSelected = true
        setTipValue(p: 10)
    }
    @IBAction func twentyTipPressed(_ sender: UIButton) {
        clearTipBackgrounds()
        twentyPercentField.isSelected = true
        setTipValue(p: 20)
    }
    
    
    @IBAction func splitCountChanged(_ sender: UIStepper) {
        splitCount = Int(sender.value)
        splitField.text = "\(splitCount)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func clearTipBackgrounds(){
        zeroPercentField.isSelected = false
        tenPercentField.isSelected = false
        twentyPercentField.isSelected = false
    }
    
    func setTipValue(p percentage: Int) {
        tip = percentage
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let strNumber1 = billTextField.text ?? "0.0"
        let NSstringFromString = NSString(string: strNumber1)
        bill = NSstringFromString.doubleValue
        print(bill)
        
        let tipValue = bill * Double(tip) / Double(100)
        sum = bill + tipValue
        print(sum)
        
        let splittedValue = sum / Double(splitCount)
        print(splittedValue)
        
    }
    
}


