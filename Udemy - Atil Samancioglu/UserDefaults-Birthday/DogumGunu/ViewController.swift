//
//  ViewController.swift
//  DogumGunu
//
//  Created by Berkin İnceoğlu on 11/7/19.
//  Copyright © 2019 Berkin İnceoğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let storedName = UserDefaults.standard.object(forKey: "name")
        if let myName = storedName as? String{
                    nameLabel.text = "Name: \(myName)"
        }
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        if let myBirthday = storedBirthday as? String{
            birthdayLabel.text = "Birthday: \(myBirthday)"
        }
        
        
    }
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birthday: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        UserDefaults.standard.set(name.text, forKey: "name")
        UserDefaults.standard.set(birthday.text, forKey: "birthday")
        
        nameLabel.text = "Name: \(name.text!)"
        birthdayLabel.text = "Birthday: \(birthday.text!)"
    }
    @IBAction func deleteButtonClicked(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday: "
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

