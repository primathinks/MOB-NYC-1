//
//  ViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ArrayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    /*
    TODO one: Add a table view AND a text input box to this view controller, either in code or via the storyboard. Accept keyboard input from the text view when the return key is pressed. Add the string that was entered into the text view into an array of strings (stored in this class).
    TODO two: Make this class a UITableViewDelegate and UITableViewDataSource that supply the above table view with cells. These cells should correspond to the text entered into the text box. E.g. If the text "one", then "two", then "three" was entered into the text box, there should be three cells in this table view that contain those strings in order.
    
    */
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    // textField delegates
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == self.textField {
            textField.text = nil
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.textField && !self.textField.text.isEmpty {
            textField.resignFirstResponder()
            if let item = textField.text {
                items.append(item)
                tableView.reloadData()
            }
        }
        return true
    }
    
    // tableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
}

