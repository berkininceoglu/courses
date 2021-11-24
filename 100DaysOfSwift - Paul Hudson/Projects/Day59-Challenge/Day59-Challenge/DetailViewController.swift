//
//  DetailViewController.swift
//  Day59-Challenge
//
//  Created by Berkin İnceoğlu on 24.11.2021.
//

import UIKit

class DetailViewController: UIViewController {
    var countryName: String = ""
    var capital : String?
    
    @IBOutlet weak var capitalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = countryName
        if let capitalCity = capital {
            capitalLabel.text = "Capital is \(capitalCity)"
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
