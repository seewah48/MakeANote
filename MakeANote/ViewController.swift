//
//  ViewController.swift
//  MakeANote
//
//  Created by Manasa on 2/21/18.
//  Copyright © 2018 baitinti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var labelVC: UITextField!
    
    @IBOutlet weak var textViewVC: UITextView!
    var editNote: MyNotes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let note = editNote{
            labelVC.text = note.title
            textViewVC.text = note.detail
        }
        self.textViewVC.delegate = self
        
    }
    
    func textViewShouldReturn(textView: UITextView!) -> Bool {
        self.view.endEditing(true);
        return true;
    }
    
    @IBAction func onClickSave(_ sender: Any) {
        var newNote: MyNotes?
        if let note = editNote{
            newNote = note
        }else{
         newNote = MyNotes(context: context)
        }
        newNote?.title = labelVC.text
        newNote?.detail = textViewVC.text
        do {
            ad.saveContext()
            labelVC.text = ""
            textViewVC.text = ""
        } catch {
            print("cannot save")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

