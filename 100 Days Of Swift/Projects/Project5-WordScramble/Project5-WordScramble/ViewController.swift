//
//  ViewController.swift
//  Project5-WordScramble
//
//  Created by Berkin İnceoğlu on 13.10.2021.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(restartGame))
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsURL){
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty{
            allWords = ["silkworm"]
        }
        
        startGame()
    }
    
    func startGame(){
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer(){
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField() //add text box to alert controller
        
        let submitAction = UIAlertAction(title: "Submit", style: .default){
            [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    @objc func restartGame(){
        usedWords = []
        tableView.reloadData()
        title = allWords.randomElement()
    }
    
    func submit(_ answer: String){
        let lowerAnswer = answer.lowercased()
        
        if isPossible(word: lowerAnswer){
            if isOriginal(word: lowerAnswer){
                if isReal(word: lowerAnswer){
        
                    usedWords.insert(answer, at: 0)
                    
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    
                    return
                }
                else{
                    showError(et: "Word is not recognized!", em: "You cannot just make words up.")
                }
            }
            else{
                showError(et: "Word already used!", em: "Be more original.")
            }
        }else{
            showError(et: "Word is not possible!", em: "You cannot spell that word from \(title!.lowercased()).")
        }
        
        
    }
    
    func isPossible(word : String) -> Bool{
        guard var tempWord  = title?.lowercased() else { return false }
        for letter in word{
            if let position = tempWord.firstIndex(of: letter){
                tempWord.remove(at: position)
            }
            else{
                return false
            }
        }
        return true
    }
    
    func isOriginal(word : String) -> Bool{
        return !usedWords.contains(word)
    }
    
    func isReal(word : String) -> Bool{
        if(word.count < 3){
            return false
        }
        if(word == title){
            return false
        }
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func showError(et errorTitle: String, em errorMessage: String ){
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(ac, animated: true)
    }


}

