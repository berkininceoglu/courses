//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    //
    var originalSeconds = 100
    var secondsRemaining = 60
    
    var timer = Timer()
    
    @IBOutlet weak var progressBard: UIProgressView!
    
    @IBOutlet weak var eggLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBard.progress = 100.0
        timer.invalidate()
        
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]!
        originalSeconds = secondsRemaining
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
    }

    @objc func updateTimer(){
           secondsRemaining -= 1
        var prog: Float = Float(secondsRemaining)/Float(originalSeconds)
        progressBard.progress = prog
           if secondsRemaining == -1 {
                   timer.invalidate()
            eggLabel.text = "Done"
               }
        
    }
    
    
}
