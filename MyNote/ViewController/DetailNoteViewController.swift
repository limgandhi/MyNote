//
//  DetailNoteViewController.swift
//  MyNote
//
//  Created by Hyunyou Lim on 2022/03/28.
//

import UIKit

class DetailNoteViewController: UIViewController {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var contentField: UITextView!
    
    var note: Note?
    var noteTitle: String?
    var noteContent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.noteTitle = note?.title ?? "Shit"
        self.noteContent = note?.content ?? "You have no Content"
        titleField.text = self.noteTitle
        titleField.font = .boldSystemFont(ofSize: 20)
        contentField.text = self.noteContent
    }
    
    //NoteListViewController로 unwind호출하는 메소드(save button에 이식)
    @IBAction func touchUpSaveButton(_ sender: UIBarButtonItem){
        self.performSegue(withIdentifier: "unwindToNoteListViewController", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
