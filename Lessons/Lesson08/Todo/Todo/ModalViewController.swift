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
    
    func addTask() {
        var newTask = ["name": textField.text!, "status": statusField.text!, "dueDate": dueDateField.text!]
        todoViewController?.tasks.append(newTask)
    }
    
    @IBAction func didTapButton(sender: AnyObject) {
        addTask()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        addTask()
        dismissViewControllerAnimated(true, completion: nil)
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

