//
//  ViewController.swift
//  Todo
//
//  Created by Rudd Taylor on 1/21/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var statusField: UITextField!
    @IBOutlet weak var dueDateField: UITextField!
    
    var todoViewController: MainTableViewController?
    
    func isValidated() -> Bool {
        return !textField.text.isEmpty && !statusField.text.isEmpty && !dueDateField.text.isEmpty
    }
    
    @IBAction func didTapButton(sender: AnyObject) {
        if isValidated() {
            if let name = textField.text {
                if let status = statusField.text {
                    if let dueDate = dueDateField.text {
                        var newTask = ["name": name, "status": status, "dueDate": dueDate]
                        todoViewController?.tasks.append(newTask)
                        
                        let notificationCenter = NSNotificationCenter.defaultCenter()
                        notificationCenter.postNotificationName("todoAdded", object: nil)
                        
                        dismissViewControllerAnimated(true, completion: nil)
                    }
                }
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == dueDateField {
            didTapButton(textField)
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

