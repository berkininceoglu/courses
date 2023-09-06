//
//  ViewController.swift
//  Project2-Flags
//
//  Created by Berkin İnceoğlu on 1.10.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var flag1: UIButton!
    @IBOutlet weak var flag2: UIButton!
    @IBOutlet weak var flag3: UIButton!
    
    var countries = [String]()
    var questionsAnswered: Int = 0
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
countries += ["estonia", "france", "germany", "italy", "ireland", "monaco", "nigeria", "poland", "russia", "uk", "us"]
        
        askQuestion()
        
        flag1.layer.borderWidth = 1
        flag2.layer.borderWidth = 1
        flag3.layer.borderWidth = 1
        
        flag1.layer.borderColor = UIColor.lightGray.cgColor
        flag2.layer.borderColor = UIColor.lightGray.cgColor
        flag3.layer.borderColor = UIColor.lightGray.cgColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareScore))
        
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        flag1.setImage(UIImage(named: countries[0]), for: .normal)
        
        flag2.setImage(UIImage(named: countries[1]), for: .normal)
        
        flag3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " - Score: \(score)"
    }
    
    func restartGame(action: UIAlertAction! = nil){
        score = 0
        questionsAnswered=0
        
        askQuestion()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let questionLimit: Int = 10
        questionsAnswered += 1
        
        if(questionsAnswered == questionLimit){
            let ac = UIAlertController(title: title, message: "Final score is \(score) out of \(questionLimit).", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: restartGame))
            
            present(ac,animated: true)

        }
        if(sender.tag == correctAnswer)
        {
            title = "Correct"
            score += 1
        }
        else{
            title = "Wrong! That is the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac,animated: true)
    }
    
    @objc func shareScore() {
        let message = "My score is \(score). I challenge you to beat me!"
        let vc = UIActivityViewController(activityItems: [message], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

