//
//  ViewController.swift
//  Kenny
//
//  Created by Berkin İnceoğlu on 11/8/19.
//  Copyright © 2019 Berkin İnceoğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cartman1: UIImageView!
    @IBOutlet weak var cartman2: UIImageView!
    @IBOutlet weak var cartman3: UIImageView!
    @IBOutlet weak var cartman4: UIImageView!
    @IBOutlet weak var cartman5: UIImageView!
    @IBOutlet weak var cartman6: UIImageView!
    @IBOutlet weak var cartman7: UIImageView!
    @IBOutlet weak var cartman8: UIImageView!
    @IBOutlet weak var cartman9: UIImageView!
    
    var cartmanArray = [UIImageView] ()
    var gestureArray = [UIGestureRecognizer] ()
    
    let gestureRecognizer1 = UITapGestureRecognizer (target: self, action: #selector (increaseScore))
    let gestureRecognizer2 = UITapGestureRecognizer (target: self, action: #selector (increaseScore))
    let gestureRecognizer3 = UITapGestureRecognizer (target: self, action: #selector (increaseScore))
    let gestureRecognizer4 = UITapGestureRecognizer (target: self, action: #selector (increaseScore))
    let gestureRecognizer5 = UITapGestureRecognizer (target: self, action: #selector (increaseScore))
    let gestureRecognizer6 = UITapGestureRecognizer (target: self, action: #selector (increaseScore))
    let gestureRecognizer7 = UITapGestureRecognizer (target: self, action: #selector (increaseScore))
    let gestureRecognizer8 = UITapGestureRecognizer (target: self, action: #selector (increaseScore))
    let gestureRecognizer9 = UITapGestureRecognizer (target: self, action: #selector (increaseScore))
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    

    var score=0
    var count = 10
    var highScore = 0
    var timer = Timer()
    var showTimer = Timer()
    
    
    
   
    
    override func viewDidLoad() {
        cartmanArray = [cartman1, cartman2, cartman3, cartman4, cartman5, cartman6, cartman7, cartman8, cartman9]

        
        for cartman in cartmanArray{
            cartman.isUserInteractionEnabled=true;
            let gestureRecognizer = UITapGestureRecognizer(target: self , action: #selector(increaseScore))
            cartman.addGestureRecognizer(gestureRecognizer)

        }
        
        let storedHS = UserDefaults.standard.object(forKey: "highScore")
        if storedHS == nil {
            highScore = 0
            highScoreLabel.text =  "High Score: \(highScore)"
            
        }
    }
    
    @IBAction func startClicked(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        showTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideCartman ), userInfo: nil, repeats: true)
    }
    
    @objc func countdown(){
        timeLabel.text = "Time: \(count)"
        count -= 1
        
        if count == 0 {
            timeLabel.text = "Time: \(count)"
            timer.invalidate()
            showTimer.invalidate()
            
            if self.score > self.highScore{
                self.highScore = self.score
                highScoreLabel.text =  "High Score: \(highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highScore")
            }
            let alert = UIAlertController(title: "Time's up!", message: "Do you want to play again?", preferredStyle: UIAlertControllerStyle.alert)
            let okayButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            
            let restartButton = UIAlertAction(title: "Restart", style: UIAlertActionStyle.default) { (UIAlertAction) in
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.count = 10
                self.timeLabel.text = "Time : \(self.count)"
                
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
                self.showTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideCartman ), userInfo: nil, repeats: true)
                
            }
            alert.addAction(okayButton)
            alert.addAction(restartButton)
            self.present(alert, animated:  true, completion:  nil)
            
        }
        
    }
    
    @objc func hideCartman (){
       
        for cartman in cartmanArray{
            cartman.isHidden = true
        }
        
            let number = Int(arc4random_uniform(9))
        cartmanArray[number].isHidden = false
        
    }
    
    

    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }

}

