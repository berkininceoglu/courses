//
//  ViewController.swift
//  Day32-Challenge-ShoppingList
//
//  Created by Berkin İnceoğlu on 18.10.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(clearList))
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
               cell.textLabel?.text = shoppingList[indexPath.row]
               return cell
    }
    
    
    @objc func addItem(){
        shoppingList.append("new item")
        tableView.reloadData()
    }
    
    @objc func clearList(){
        shoppingList.removeAll()
        tableView.reloadData()
    }
    


}

