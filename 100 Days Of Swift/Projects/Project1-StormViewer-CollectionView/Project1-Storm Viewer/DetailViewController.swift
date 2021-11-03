//
//  DetailViewController.swift
//  Project1-Storm Viewer
//
//  Created by Berkin İnceoğlu on 30.09.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    var orderCount: Int = 0
    var totalCount: Int = 0

    
    
    override func viewDidLoad() {
        let defaults = UserDefaults.standard
        
        super.viewDidLoad()
        
        title = "\(orderCount+1) of \(totalCount)"
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage{
            imageView.image = UIImage(named:imageToLoad)
            
            var imageViewCounter = defaults.integer(forKey: imageToLoad) + 1
            print(imageViewCounter)
            defaults.set(imageViewCounter, forKey: imageToLoad)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
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
