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
    var tipPercentage : Int = 0
    var sum : Double = 0.0
    var splitPerson : Int = 2
    var splittedValue : Double = 0.0
    
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
        splitPerson = Int(sender.value)
        splitField.text = "\(splitPerson)"
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
        tipPercentage = percentage
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let strNumber1 = billTextField.text ?? "0.0"
        let NSstringFromString = NSString(string: strNumber1)
        bill = NSstringFromString.doubleValue

        let tipValue = bill * Double(tipPercentage) / Double(100)
        sum = bill + tipValue
        
        splittedValue = sum / Double(splitPerson)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             if(segue.identifier == "ShowResultsSegue"){
                 let destinationVC = segue.destination as! ResultViewController
                 //as! = force downcast
                destinationVC.splitValue = splittedValue
                destinationVC.splitPerson = splitPerson
             }
         }
    
}


