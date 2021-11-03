//
//  2ndViewController.swift
//  SegueApp
//
//  Created by Berkin İnceoğlu on 11/7/19.
//  Copyright © 2019 Berkin İnceoğlu. All rights reserved.
//

import UIKit

class _ndViewController: UIViewController {
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
