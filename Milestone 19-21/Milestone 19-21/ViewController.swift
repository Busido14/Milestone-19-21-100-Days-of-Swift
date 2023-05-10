//
//  ViewController.swift
//  Milestone 19-21
//
//  Created by Артем Чжен on 10/05/23.
//

import UIKit

class ViewController: UITableViewController {
    lazy var notes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: nil, action: #selector(addedNewNotes))
    }
    @objc func addedNewNotes() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewController", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.textNote = notes[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

