//
//  NoteViewController.swift
//  notes
//
//  Created by Marvellous Dirisu on 12/07/2022.
//

import Foundation
import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var noteLabel: UITextView!
    
    
    public var noteTitle : String = ""
    public var note : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel?.text = noteTitle
        noteLabel.text = note
    }
    
}
