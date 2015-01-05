//
//  FourthViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    @IBOutlet weak var numTextField: UITextField!
    @IBOutlet weak var fibLabel: UILabel!
    
    func isValidated() -> Bool {
        if numTextField.text.isEmpty || numTextField.text == "0" {
            return false
        }
        return true
    }
    
    func updateLabel(str: String) {
        fibLabel.text = str
    }
    
    func makeOrdinal(num: Int) -> String {
        var currStr : String = String(num)
        var currOrdinal : String = "th"
        
        switch(currStr) {
        case "1":
            currOrdinal = "st"
        case "2":
            currOrdinal = "nd"
        case "3":
            currOrdinal = "rd"
        default:
            currOrdinal = "th"
        }
        return "\(num)" + currOrdinal
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if isValidated() {
            var currInput : Int = numTextField.text.toInt() ?? 0
            var currFibonacciAdder = FibonacciAdder()
            var currFibonacciOutput : String = String(currFibonacciAdder.fibonacciNumberAtIndex(currInput))
            updateLabel("The \(makeOrdinal(currInput)) Fibonacci number is \(currFibonacciOutput)")
            
        } else {
            updateLabel("Please enter a number greater than 0.")
        }
    }
    
/*
    TODO seven: Hook up the text input box, label and and a ‘calculate’ button. Create a ‘fibonacci adder’ class with a method ‘fibonacciNumberAtIndex' which takes indexOfFibonacciNumber (an integer).  When the button is pressed, create an instance of that class, call the method, and print out the appropriate fibonacci number of an inputted integer.
    The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number.
*/
}

class FibonacciAdder {
    var indexofFibonacciNumber : Int = 0
    
    func fibonacciNumberAtIndex(num: Int) -> Int {
        var x : Int = 0
        var y : Int = 1
        
        if num > 1 {
            for index in 1...num - 1 {
                var temp: Int = x
                x = y
                y = temp + y
            }
        }

        return x
    }
    
}