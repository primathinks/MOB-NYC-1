//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var numTextField: UITextField!
    @IBOutlet weak var sumLabel: UILabel!
    
    func isValidated() -> Bool {
        if numTextField.text.isEmpty {
            return false
        }
        return true
    }
    
    func updateLabel(str: String) {
        sumLabel.text = str
    }
    
    func addNum() {
        let currNum: Int = numTextField.text?.toInt() ?? 0
        let currSum: Int = sumLabel.text?.toInt() ?? 0
        var newSum =  currNum + currSum
        updateLabel("\(newSum)")
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if isValidated() {
            addNum()
        } else {
            updateLabel("Please enter a number")
        }
    }
    
    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
}
