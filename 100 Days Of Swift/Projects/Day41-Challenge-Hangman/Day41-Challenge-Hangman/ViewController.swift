//
//  ViewController.swift
//  Day41-Challenge-Hangman
//
//  Created by Berkin İnceoğlu on 25.10.2021.
//

import UIKit

class ViewController: UIViewController {
    var wordAsked: UILabel!
    var hangmanImage: UIImageView!
    var letterButtons = [UIButton]()
    var allWords = [String]()
    var answer: String!
    var revealedChars = [Character]()
    var maskedWord: String = ""
    var foul: Int = 0
    
    override func loadView(){
        view = UIView()
        view.backgroundColor = .white
        
        hangmanImage = UIImageView()
        hangmanImage.translatesAutoresizingMaskIntoConstraints = false
        hangmanImage.contentMode = .scaleAspectFill
        hangmanImage.clipsToBounds = true
        view.addSubview(hangmanImage)
        
        wordAsked = UILabel()
        wordAsked.translatesAutoresizingMaskIntoConstraints = false
        wordAsked.text = ""
        wordAsked.textAlignment = .center
        wordAsked.font = UIFont.systemFont(ofSize: 44)
        wordAsked.isUserInteractionEnabled = false
        view.addSubview(wordAsked)
        
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        
        NSLayoutConstraint.activate(
            [
                hangmanImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                hangmanImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                
                wordAsked.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                wordAsked.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
                wordAsked.topAnchor.constraint(equalTo: hangmanImage.bottomAnchor),
                
                buttonsView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.9, constant: 35),
                
                buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonsView.heightAnchor.constraint(equalToConstant: 400),
                buttonsView.topAnchor.constraint(equalTo: wordAsked.bottomAnchor),
                buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            ])
        
        let width = 95
        let height = 55
        
        for row in 0..<7{
            for column in 0..<4{
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
                letterButton.layer.borderColor = UIColor.black.cgColor
                letterButton.layer.borderWidth = 0.3
                letterButton.setTitle("", for: .normal)
                letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                
                let frame = CGRect(x: column * width, y: row * height, width: width, height: height)
                letterButton.frame = frame
                
                buttonsView
                    .addSubview(letterButton)
                letterButtons.append(letterButton)
            }
        }
    }
    override func viewDidLoad() {
        hangmanImage.image = UIImage(named: "Hangman-0")
        print(hangmanImage)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsURL){
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty{
            allWords = ["silkworm"]
        }
        
        let number = Int.random(in: 0..<allWords.count)
        answer = allWords[number]
        print(answer)
        for _ in 0..<answer.count{
            maskedWord += "*"
        }
        wordAsked.text = maskedWord
        
        for (index,char) in "ABCDEFGHIJKLMNOPQRSTUVWXYZ".enumerated() {
            letterButtons[index].setTitle(String(char), for: .normal)
        }
        
    }
    
    @objc func letterTapped(_ sender: UIButton){
        guard let buttonTitle = sender.titleLabel?.text?.uppercased() else { return }
        
        let upcAnswer = answer!.uppercased()
        
        if(upcAnswer.uppercased().contains(buttonTitle))
        {
            revealedChars.append(Character(buttonTitle))
            var newStr = ""
            var index: Int = 0
            for c in upcAnswer {
                if revealedChars.contains(c) {
                    newStr.append(c)
                } else {
                    newStr.append("*")
                }
                index += 1
            }
            
            maskedWord = newStr
            wordAsked.text = maskedWord
        }
        else{
            foul += 1
            var imageName = "Hangman-\(foul)"
            hangmanImage.image = UIImage(named: imageName)
            
        }
        sender.isEnabled = false
        sender.layer.opacity = 0.4
    }
    
}

