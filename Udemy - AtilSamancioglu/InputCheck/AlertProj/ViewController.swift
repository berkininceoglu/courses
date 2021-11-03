//
//  ViewController.swift
//  AlertProj
//
//  Created by Berkin İnceoğlu on 11/7/19.
//  Copyright © 2019 Berkin İnceoğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var password2: UITextField!
    @IBAction func signUpClicked(_ sender: Any) {
        if (userName.text == ""){
            bildirim(mesaj: "Kullanici adi alani bos birakilamaz.")
        }
        else if (password.text == "" || password2.text == ""){
            bildirim(mesaj: "Parola alani bos birakilamaz.")
        }
        else if (password.text != password2.text){
            bildirim(mesaj: "Iki parola eslesmelidir.")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func bildirim (mesaj : String){
        let alert = UIAlertController(title: "HATA", message: mesaj, preferredStyle: UIAlertControllerStyle.alert)
        let okay = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(okay)
        self.present(alert,animated: true,  completion: nil)
    }

}

