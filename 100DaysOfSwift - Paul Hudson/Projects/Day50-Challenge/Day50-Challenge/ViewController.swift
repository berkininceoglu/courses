//
//  ViewController.swift
//  Day50-Challenge
//
//  Created by Berkin İnceoğlu on 4.11.2021.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {
    var pictures = [Image]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedPictures = defaults.object(forKey: "pictures") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do{
                pictures = try jsonDecoder.decode([Image].self, from: savedPictures)
            }
            catch{
                print("Failed to load")
            }
        }
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(selectImage))
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8){
            try? jpegData.write(to: imagePath)
        }
        
        let pic = Image(imageName: imageName, caption: "Unknown")
        pictures.append(pic)
        save()
        
        tableView.reloadData()
        
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory()-> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? ImageViewCell
        else{
            fatalError("Unable to dequeue person cell.")
        }
        print(cell)
        
        let image = pictures[indexPath.row]
        cell.caption.text  = image.caption
        
        let path = getDocumentsDirectory().appendingPathComponent(image.imageName)
        cell.imageSource.image = UIImage(contentsOfFile: path.path)
        
        //        cell.imageSource.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        //        cell.imageSource.layer.borderWidth = 2
        //        cell.imageSource.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            let pic = pictures[indexPath.row]
            vc.caption = pic.caption
            vc.imageName = pic.imageName
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func save(){
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(pictures){
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "pictures")
        }
        else{
            print("Failed to save.")
        }
    }
    
    
}

