//
//  Note.swift
//  Milestone 19-21
//
//  Created by Артем Чжен on 10/05/23.
//

//import UIKit
import Foundation

struct DataNote: Codable, Identifiable {
    var id: UUID = UUID()
    var title: String = "New Note"
    var text: String = ""
    var creationDate: Date = Date.now
    
    var hasText: Bool {
        return !text.isEmpty
    }
}
