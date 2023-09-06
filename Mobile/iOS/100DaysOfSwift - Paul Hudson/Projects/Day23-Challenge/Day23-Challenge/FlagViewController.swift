//
//  FlagViewController.swift
//  Day23-Challenge
//
//  Created by Berkin İnceoğlu on 8.10.2021.
//

import UIKit

class FlagViewController: UIViewController {
    @IBOutlet weak var detailedImage: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = selectedImage{
            detailedImage.image = UIImage(named: image)
            detailedImage.layer.borderWidth = 1
            detailedImage.layer.borderColor = UIColor.black.cgColor
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        
    }
    
    @objc func shareTapped(){
        guard let image = detailedImage.image?.jpegData(compressionQuality: 0.8)
        else{
            print("No image found!")
            return
        }
        let message = selectedImage!
        print(image)
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
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
