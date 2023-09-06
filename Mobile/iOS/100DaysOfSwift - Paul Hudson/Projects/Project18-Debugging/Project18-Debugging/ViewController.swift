//
//  ViewController.swift
//  Project18-Debugging
//
//  Created by Berkin İnceoğlu on 21.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1,2,3,4,5,separator: "-")
        print("Some text with terminator :* ", "Next text", terminator: "*")
        
        //assert(1 == 2, "Math failure") //Never runs in live app
        
        for i in 1...100{
            print("Got number \(i).")
            
            //Shortcuts
            //FN+F6 next line
            //CTRL+COMMAND+Y next debug point
        }
    }


}

