//
//  FirstViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var mainLabel: UILabel!
    
    func isValidated() -> Bool{
        if nameTextField.text.isEmpty || ageTextField.text.isEmpty {
            return false
        }
        return true
    }
    
    func updateLabel(str: String) {
        mainLabel.text = str
    }
    
    func greetUser() {
        var userName: String = nameTextField.text
        var userAge: String = ageTextField.text
        var greeting: String = "Hello \(userName), you are \(userAge) years old!"
        updateLabel(greeting)
    }
    
    // Displays one or more sentences
    func listFreedom1() {
        var numAge: Int? = ageTextField.text.toInt()
        var freedom: String = "\(mainLabel.text!)\n"
 
        if numAge >= 16 {
            freedom += "You can drive. "
        }
        if numAge >= 18 {
            freedom += "You can vote. "
        }
        if numAge >= 21 {
            freedom += "You can drink. "
        }
    
        updateLabel(freedom)
    }
    
    // Displays one sentence only
    func listFreedom2() {
        var numAge: Int? = ageTextField.text.toInt()
        var freedom: String = "\(mainLabel.text!)\n"
        freedom += "You can "
        
        if numAge >= 21 {
            freedom += "drive, vote and drink (but not at the same time!"
        } else if numAge >= 18 {
            freedom += "drive and vote."
        } else if numAge >= 16 {
            freedom += "drive"
        } else {
            freedom += "do nothing."
        }
        
        updateLabel(freedom)
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if isValidated() {
            greetUser()
            //listFreedom1()
            listFreedom2()
        } else {
            updateLabel("hello world!")
        }
    }
    
    /*
    TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’
    
    TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!”
    TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
    TODO four: Hook up the button to a NEW function (in additino to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
    */
}
