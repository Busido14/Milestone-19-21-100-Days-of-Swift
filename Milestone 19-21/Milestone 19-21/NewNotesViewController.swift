//
//  DetailViewController.swift
//  Milestone 19-21
//
//  Created by Артем Чжен on 10/05/23.
//

import UIKit

class NewNotesViewController: UIViewController {
    @IBOutlet weak var noteField: UITextView!
    
    var note: DataNote!
    var saveCallback: ((DataNote) -> ())?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noteField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .done, target: self, action: #selector(shareNoteText))
        
        noteField.layer.borderColor = UIColor.black.cgColor
        noteField.layer.borderWidth = 2
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveCallback?(note)
    }
    
    @objc func shareNoteText() {
        let noteText = note.text
        
        let activityVC = UIActivityViewController(activityItems: [noteText], applicationActivities: nil)
        present(activityVC, animated: true)
    }

}
