//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Habib Miranda on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let entry = entry {
            updateWith(entry)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateWith(entry: Entry) {
        
        self.navigationItem.title = entry.title
        bodyTextView.text = entry.bodyText
        titleTextField.text = entry.title
        
    }
    
    // MARK: -Actions

    @IBAction func clearTextFieldButton(sender: AnyObject) {
        bodyTextView.text = ""
        titleTextField.text = ""
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        guard let entry = entry else {
            let newEntry = Entry(timeStamp: NSDate(), title: titleTextField.text ?? "", bodyText: bodyTextView.text ?? "")
            EntryController.sharedInstance.addEntry(newEntry)
            self.navigationController?.popToRootViewControllerAnimated(true)
            return
        }
        entry.title = titleTextField.text ?? ""
        entry.bodyText = bodyTextView.text ?? ""
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier = "
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
*/

}
