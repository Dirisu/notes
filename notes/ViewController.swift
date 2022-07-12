//
//  ViewController.swift
//  notes
//
//  Created by Marvellous Dirisu on 12/07/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var table: UITableView!
    
    var models : [(title: String, note: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        title = "Notes"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "note") as? NoteViewController else {
            
            return
        }
        vc.title = "Note"
        vc.noteTitle = model.title
        vc.note = model.note
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func addNote(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "new") as? EntryViewController else {
            
            return
        }
        vc.title = "New Note"
        vc.completion = { noteTitle, note in
            self.navigationController?.popViewController(animated: true)
            self.models.append((noteTitle, note))
            self.table.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

