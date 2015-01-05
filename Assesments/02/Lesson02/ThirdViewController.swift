//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var numTextField: UITextField!
    @IBOutlet weak var parityLabel: UILabel!
    
    func isValidated() -> Bool{
        if numTextField.text.isEmpty {
            return false
        }
        return true
    }
    
    func updateLabel(str: String) {
        parityLabel.text = str
    }
    
    func testParity() {
        var parity:String = "is "
        let currNum: Int = numTextField.text?.toInt() ?? 0
        
        if currNum % 2 == 0 {
            parity += "even"
        } else {
            parity += "odd"
        }
        
        updateLabel(parity)
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if isValidated() {
            testParity()
        } else {
            updateLabel("Please enter a number.")
        }
    }
    
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
}
