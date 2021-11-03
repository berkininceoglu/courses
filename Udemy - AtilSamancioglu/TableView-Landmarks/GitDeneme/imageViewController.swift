//
//  imageViewController.swift
//  GitDeneme
//
//  Created by Berkin İnceoğlu on 11/15/19.
//  Copyright © 2019 Berkin İnceoğlu. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
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
