//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Berkin İnceoğlu on 27.09.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var splitValue: Double = 0.0
    var splitPerson: Int = 0
    
    @IBOutlet weak var splittedValueField: UILabel!
    @IBOutlet weak var splitMessageField: UILabel!
    
    override func viewDidLoad() {
        splittedValueField.text = String(splitValue)
        super.viewDidLoad()

       
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
    }
    
}
