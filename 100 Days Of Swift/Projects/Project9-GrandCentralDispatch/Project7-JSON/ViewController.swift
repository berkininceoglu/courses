//
//  ViewController.swift
//  Project7-JSON
//
//  Created by Berkin İnceoğlu on 19.10.2021.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var constantPetitions = [Petition]()
    var filteredPetitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moreButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(moreButtonClicked))
        
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonClicked))
        
        navigationItem.setRightBarButtonItems([moreButton,searchButton], animated: true)
        
        let urlString: String
        if navigationController?.tabBarItem.tag == 0 {
            urlString =
                "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            [weak self] in
            if let url = URL(string: urlString){
                if let data = try? Data(contentsOf: url){
                    self?.parse(json: data)
                    return                }
            }
            self?.showError()
        }
        
    }
    
    func showError(){
        DispatchQueue.main.async {
            [weak self] in
            let ac = UIAlertController(title: "Loading error!", message: "There was a problem loading a feed. Please check your connection and try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(ac, animated: true)
        }
        
    }
    
    func parse(json: Data){
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){
            petitions = jsonPetitions.results
            constantPetitions = petitions
            DispatchQueue.main.async {
                [weak self] in
                self?.tableView.reloadData()
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc =  DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func moreButtonClicked(){
        let alert = UIAlertController(title: "Source", message: "Data come from the We The People API of the Whitehhouse.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @objc func searchButtonClicked(){
        let ac = UIAlertController(title: "Search", message: "Enter the word you want to filter.", preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default){
            [weak self, weak ac] _ in
            guard let query = ac?.textFields?[0].text else { return }
            self?.submitSearch(query: query)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submitSearch(query: String){
        if(query.isEmpty){
            petitions = constantPetitions
            tableView.reloadData()
        }else{
            filteredPetitions = petitions.filter({
            $0.title.lowercased().contains(query.lowercased())
            })
            petitions = filteredPetitions
            tableView.reloadData()
        }
        
    }
    
}

