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
    
    let questions = ["Four plus four is equal to eight.",
    "Square of four is fifty-three.",
    "Root of twenty-five is five."]
    
    var questionCounter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questions[questionCounter]
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        questionCounter += 1
        if(questionCounter == questions.count){
            questionCounter = 0
        }
        updateUI()
    }
    
    func updateUI(){
        questionLabel.text = questions[questionCounter]
    }
    
}

