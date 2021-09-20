//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let questions = [
    ["Four plus four is equal to eight.", "True"],
    ["Square of four is fifty-three.", "False"],
    ["Root of twenty-five is five.", "True"]
    ]
    
    var questionCounter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questions[questionCounter][0]
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnwer = sender.currentTitle
        
        if(questions[questionCounter][1] == userAnwer){
            print("right")
        }
        else{
            print("wrong")
        }
        
        questionCounter += 1
        if(questionCounter == questions.count){
            questionCounter = 0
        }
        updateUI()
    }
    
    func updateUI(){
        questionLabel.text = questions[questionCounter][0]
    }
    
}

