//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    /*
    TODO three: Add TWO text views and a table view to this view controller, either using code or storybaord. Accept keyboard input from the two text views. When the 'return' button is pressed on the SECOND text view, add the text view data to a dictionary. The KEY in the dictionary should be the string in the first text view, the VALUE should be the second.
    TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.
    TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
    */

    @IBOutlet weak var keyTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var mapArray: [Dictionary<String, String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyTextField.delegate = self
        valueTextField.delegate = self
    }
    
    func isValidated() -> Bool {
        return !keyTextField.text.isEmpty && !valueTextField.text.isEmpty
    }
    
    // textField delegate
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == keyTextField || textField == valueTextField {
            textField.text = nil
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == valueTextField && isValidated() {
            textField.resignFirstResponder()
            if let key = keyTextField.text {
                if let value = valueTextField.text {
                    var pair = ["key": key, "value": value]
                    self.mapArray.append(pair)
                    self.tableView.reloadData()
                }
            }
        }
        return true
    }
    
    // tableView delegate and datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mapArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        var pair = self.mapArray[indexPath.row]
       
        cell.textLabel?.text = pair["key"]
        cell.detailTextLabel?.text = pair["value"]
        return cell
    }
    
}
