//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var levelCounter = 0
    let stories = [Story(
                    title:"You see fork in the road",
                    choice1: "Take a left",
                    choice2: "Take a right"),
                   Story(
                       title:"You see a tiger",
                       choice1: "Shout for help",
                       choice2: "Play dead"),
                   Story(
                       title:"You find a treasure chest",
                       choice1: "Open it",
                       choice2: "Check for traps")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyLabel.text = stories[levelCounter].title
        choice1Button.setTitle(stories[levelCounter].choice1, for: .normal)
        choice2Button.setTitle(stories[levelCounter].choice2, for: .normal)

    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        let userChoice = sender.titleLabel?.text
        updateUI(choice: userChoice!)
    }
    
    func updateUI(choice : String){
        if(choice == "Choice 1"){
            levelCounter = levelCounter * 2
        }
        else{
            levelCounter = levelCounter * 2 + 1
        }
        
        storyLabel.text = stories[levelCounter].title
        choice1Button.setTitle(stories[levelCounter].choice1, for: .normal)
        choice2Button.setTitle(stories[levelCounter].choice2, for: .normal)
    }
    
    
}

