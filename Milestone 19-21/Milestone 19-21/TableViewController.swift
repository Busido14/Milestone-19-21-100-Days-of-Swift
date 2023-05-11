//
//  ViewController.swift
//  Milestone 19-21
//
//  Created by Артем Чжен on 10/05/23.
//

import UIKit

class TableViewController: UITableViewController {
    var notes: [DataNote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(addedNewNotes))
        
    }
    
    @objc func addedNewNotes() {
        if let noteVC = storyboard?.instantiateViewController(withIdentifier: "New") as? NewNotesViewController {
            noteVC.note = DataNote()
            noteVC.saveCallback = { [weak self] note in
                self?.notes.append(note)
                self?.tableView.reloadData()
                
            }
            navigationController?.pushViewController(noteVC, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = note.title
        cell.detailTextLabel?.text = note.text.isEmpty ? "No additional text" : note.text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        
        if let noteVC = storyboard?.instantiateViewController(withIdentifier: "New") as? NewNotesViewController {
            noteVC.note = note
            noteVC.saveCallback = { [weak self] note in
                self?.notes.append(note)
                
                self?.tableView.reloadData()
            }
            navigationController?.pushViewController(noteVC, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

