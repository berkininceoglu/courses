//
//  ViewController.swift
//  FirstApp
//
//  Created by Berkin İnceoğlu on 30.01.2019.
//  Copyright © 2019 Berkin İnceoğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var num1: UITextField!
    @IBOutlet weak var num2: UITextField!
    @IBOutlet weak var resultView: UILabel!
    
    
    @IBAction func toplama(_ sender: Any) {
        if let number = Int(num1.text!), let number2 = Int(num2.text!){
        resultView.text = String( number + number2)
        }
    }
    @IBAction func cikarma(_ sender: Any) {
        if let number = Int(num1.text!), let number2 = Int(num2.text!){
            resultView.text = String( number - number2)
        }
    }
    @IBAction func carpma(_ sender: Any) {
        if let number = Int(num1.text!), let number2 = Int(num2.text!){
            resultView.text = String( number * number2)
        }
    }
    @IBAction func bolme(_ sender: Any) {
        if let number = Int(num1.text!), let number2 = Int(num2.text!){
            resultView.text = String(number / number2)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

