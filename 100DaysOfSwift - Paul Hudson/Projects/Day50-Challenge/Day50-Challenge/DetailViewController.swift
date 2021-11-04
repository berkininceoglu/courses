//
//  DetailViewController.swift
//  Day50-Challenge
//
//  Created by Berkin İnceoğlu on 4.11.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    
    var caption: String = ""
    var imageName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = getDocumentsDirectory().appendingPathComponent(imageName)
        detailImage.image = UIImage(contentsOfFile: path.path)
    }
    
    func getDocumentsDirectory()-> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
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
