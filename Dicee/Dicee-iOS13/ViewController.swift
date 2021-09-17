//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

func GetImageName(rand : Int) -> String{
    switch rand {
    case 1:
        return "DiceOne"
    case 2:
        return "DiceTwo"
    case 3:
        return "DiceThree"
    case 4:
        return "DiceFour"
    case 5:
        return "DiceFive"
    default:
        return "DiceSix"
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var leftHandDice: UIImageView!
    @IBOutlet weak var rightHandDice: UIImageView!
    @IBAction func rollDice(_ sender: Any) {
        let firstRandomDice = Int.random(in: 1...6)
        let secondRandomDice = Int.random(in: 1...6)
        let firstImage = GetImageName(rand: firstRandomDice)
        let secondImage =  GetImageName(rand: secondRandomDice)
        leftHandDice.image = UIImage(named: firstImage)
        rightHandDice.image = UIImage(named: secondImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftHandDice.image = UIImage(named: "DiceOne")
        //leftHandDice.alpha = 0.5
        rightHandDice.image = UIImage(named: "DiceTwo")
        
        //diceArray.randomElement()
        //ToDoB:
        
    }
}

