//
//  ViewController.swift
//  Project1-Storm Viewer
//
//  Created by Berkin İnceoğlu on 29.09.2021.
//

import UIKit

class ViewController: UICollectionViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "StormViewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareApp))
        
        performSelector(inBackground: #selector(loadPictures), with: nil)
    }
    
    @objc func loadPictures() {
        let fm = FileManager.default
        
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures.sort()
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Picture", for: indexPath) as? Cell else{
            fatalError("Unable to dequeue picture cell.")
        }
        
        let image = pictures[indexPath.item]
        cell.imageLabel.text = image
        cell.imageLabel.textColor = .systemBackground
        
        cell.imageView.image = UIImage(named: image)
        
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped")
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            print(vc)
            print(pictures[indexPath.row])
            vc.selectedImage = pictures[indexPath.row]
            vc.orderCount = indexPath.row
            vc.totalCount = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func shareApp() {
        guard let name = URL(string: "https://apps.apple.com/tr/app/whatsapp-messenger/id310633997")
        else{
            print("App could not be found!")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [name], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}

