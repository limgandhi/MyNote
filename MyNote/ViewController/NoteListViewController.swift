//
//  ViewController.swift
//  MyNote
//
//  Created by Hyunyou Lim on 2022/03/27.
//

import UIKit

class NoteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let cellIdentifier = "cell"
    @IBOutlet weak var noteTableView: UITableView!
    @IBOutlet var addButton: UIBarButtonItem!
    var secureView: UIView!
    
    @IBAction func touchUpEditButton(_ sender: UIBarButtonItem){
        self.noteTableView.setEditing(!noteTableView.isEditing, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view.
        noteTableView.delegate = self
        noteTableView.dataSource = self
        NoteList.notes.append(Note(title: "Ssibal", content: "Fuck"))
        
    }
    
    //table row count 반환 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteList.notes.count
    }

    //table cell 지정 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = noteTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let title = NoteList.notes[indexPath.row].title
        cell.textLabel?.text = title
        return cell
    }
    
    //테이블에서 선택한 후 선택한 셀을 풀어주는(deselect) 메소드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.noteTableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Segue prepare 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailController = segue.destination as? DetailNoteViewController else {
            return
        }
        if let index = self.noteTableView.indexPathForSelectedRow?.row{
            detailController.note = NoteList.notes[index]
        }
    }
    
    //Editing Style 삭제 기능 추가
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("deleteit!")
//            NoteList.notes.remove(at: indexPath.row)
//            tableView.reloadData()
        }
    }

    //UnwindSegue(DetailNoteViewController -> NoteListViewController
    @IBAction func unwindToNoteListViewController(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? DetailNoteViewController{
            guard let note = sourceViewController.note else {
                return
            }
            NoteList.notes.append(note)
        }
        // Use data from the view controller which initiated the unwind segue
        
        noteTableView.reloadData()
    }

}
