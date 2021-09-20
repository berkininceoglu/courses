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
    
    struct question{
        let title : String
        let answer : String
    }
    
    let questions = [
        question(title: "Four plus four is equal to eight.", answer: "True"),
        question(title: "Square of four is fifty-three.", answer: "False"),
        question(title: "Root of twenty-five is five.", answer: "True")
    ]
    
    var questionCounter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = questions[questionCounter].title
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnwer = sender.currentTitle
        
        if(questions[questionCounter].answer == userAnwer){
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
        questionLabel.text = questions[questionCounter].title
    }
    
}

