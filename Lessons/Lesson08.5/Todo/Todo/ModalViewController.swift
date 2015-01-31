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
    @IBOutlet weak var statusTextField: UITextField!
    
    @IBOutlet weak var duedateTextField: UITextField!
    
    var todoViewController: MainTableViewController?
    
    @IBAction func didTapButton(sender: AnyObject) {
        if let name = textField.text {
            var newTask = ["name": name, "status": "open", "dueDate": "today"]
            todoViewController?.todos.append(newTask)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textField.delegate = self
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.placeholder = "something"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

