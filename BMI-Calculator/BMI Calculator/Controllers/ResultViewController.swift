//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Berkin İnceoğlu on 22.09.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    var bmiValue : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = bmiValue!
    }
    @IBAction func recalculatePressed(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
