//
//  ViewController.swift
//  SegueApp
//
//  Created by Berkin İnceoğlu on 11/7/19.
//  Copyright © 2019 Berkin İnceoğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    var username = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print ("viewDidLoad Called ")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print ("viewDidDisappear Called ")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print ("viewWillDisappear Called ")
        nameText.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print ("viewWillAppear called")
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        username = nameText.text!
        performSegue(withIdentifier: "nextSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "nextSegue"){
            let destination = segue.destination as! _ndViewController
            destination.name = "Ooo sevgili \(username) hosgeldin!"
        }
    }


}

