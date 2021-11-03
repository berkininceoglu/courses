//
//  ViewController.swift
//  timer
//
//  Created by Berkin İnceoğlu on 11/8/19.
//  Copyright © 2019 Berkin İnceoğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = Timer()
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 10
        
        timeLabel.text = "time: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction(){
        timeLabel.text = "time: \(counter)"
        counter -= 1
        
        if counter == 0 {
                timer.invalidate()
            timeLabel.text = "time is over"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        counter = 10
//        for time in 1...10{
//            counter = counter - 1
//            timeLabel.text = "Time: \(counter)"
//            Thread.sleep(forTimeInterval: 1)
//            
//        }
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        print("button clicked")
    }
    
    



}

