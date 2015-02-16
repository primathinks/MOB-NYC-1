//
//  ViewController.swift
//  Calculator
//
//  Created by Prima Prasertrat on 2/15/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let calculator = CalculatorModel()
    var tappingNumbers = false
    
    var displayLabel = UILabel()
    
    var clearButton = UIButton()
    var plusMinusButton = UIButton()
    var percentButton = UIButton()
    var divideButton = UIButton()
    
    var sevenButton = UIButton()
    var eightButton = UIButton()
    var nineButton = UIButton()
    var multiplyButton = UIButton()
    
    var fourButton = UIButton()
    var fiveButton = UIButton()
    var sixButton = UIButton()
    var subtractButton = UIButton()
    
    var oneButton = UIButton()
    var twoButton = UIButton()
    var threeButton = UIButton()
    var addButton = UIButton()
    
    var zeroButton = UIButton()
    var decimalButton = UIButton()
    var equalButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutButtons()
    }
    
    func layoutButtons() {
        let buttonWidth = self.view.frame.width / 4
        let buttonHeight = buttonWidth
        let labelWidth = self.view.frame.width - 20
        let labelHeight = self.view.frame.height - (buttonHeight * 5)
        let buttonFontSize:CGFloat = 36
        let labelFontSize:CGFloat = 60
        let buttonColor = UIColor.lightGrayColor()
        let labelColor = UIColor.darkGrayColor()
        let fontName = "Avenir-Light"
        
        var numberButtons = [oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, zeroButton]
        var operatorButtons = [divideButton, multiplyButton, subtractButton, addButton, equalButton]
        var specialButtons = [clearButton, plusMinusButton, percentButton, decimalButton]
        var allButtons = numberButtons + operatorButtons + specialButtons
        
        self.view.backgroundColor = labelColor
        displayLabel.frame = CGRect(x: 0, y: 0, width: labelWidth, height: labelHeight)
        displayLabel.backgroundColor = labelColor
        displayLabel.text = "0"
        displayLabel.textColor = UIColor.whiteColor()
        //displayLabel.font = UIFont.systemFontOfSize(labelFontSize)
        displayLabel.font = UIFont(name: fontName, size: labelFontSize)
        displayLabel.textAlignment = .Right
        
        //row 1
        clearButton.frame = CGRect(x: 0, y: displayLabel.frame.maxY, width: buttonWidth, height: buttonHeight)
        clearButton.setTitle("C", forState: .Normal)
        
        plusMinusButton.frame = CGRect(x: clearButton.frame.maxX, y: displayLabel.frame.maxY, width: buttonWidth, height: buttonHeight)
        plusMinusButton.setTitle("+/-", forState: .Normal)
        
        percentButton.frame = CGRect(x: plusMinusButton.frame.maxX, y: displayLabel.frame.maxY, width: buttonWidth, height: buttonHeight)
        percentButton.setTitle("%", forState: .Normal)
        
        divideButton.frame = CGRect(x: percentButton.frame.maxX, y: displayLabel.frame.maxY, width: buttonWidth, height: buttonHeight)
        divideButton.setTitle("÷", forState: .Normal)
        
        //row 2
        sevenButton.frame = CGRect(x: 0, y: clearButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        sevenButton.setTitle("7", forState: .Normal)
        
        eightButton.frame = CGRect(x: sevenButton.frame.maxX, y: clearButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        eightButton.setTitle("8", forState: .Normal)
        
        nineButton.frame = CGRect(x: eightButton.frame.maxX, y: clearButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        nineButton.setTitle("9", forState: .Normal)
        
        multiplyButton.frame = CGRect(x: nineButton.frame.maxX, y: clearButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        multiplyButton.setTitle("×", forState: .Normal)
        
        //row 3
        fourButton.frame = CGRect(x: 0, y: sevenButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        fourButton.setTitle("4", forState: .Normal)
        fiveButton.frame = CGRect(x: fourButton.frame.maxX, y: sevenButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        fiveButton.setTitle("5", forState: .Normal)
        sixButton.frame = CGRect(x: fiveButton.frame.maxX, y: sevenButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        sixButton.setTitle("6", forState: .Normal)
        subtractButton.frame = CGRect(x: sixButton.frame.maxX, y: sevenButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        subtractButton.setTitle("−", forState: .Normal)
        
        //row 4
        oneButton.frame = CGRect(x: 0, y: fourButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        oneButton.setTitle("1", forState: .Normal)
        twoButton.frame = CGRect(x: oneButton.frame.maxX, y: fourButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        twoButton.setTitle("2", forState: .Normal)
        threeButton.frame = CGRect(x: twoButton.frame.maxX, y: fourButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        threeButton.setTitle("3", forState: .Normal)
        addButton.frame = CGRect(x: threeButton.frame.maxX, y: fourButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        addButton.setTitle("+", forState: .Normal)
        
        //row 5
        zeroButton.frame = CGRect(x: 0, y: oneButton.frame.maxY, width: buttonWidth * 2, height: buttonHeight)
        zeroButton.setTitle("0", forState: .Normal)
        decimalButton.frame = CGRect(x: zeroButton.frame.maxX, y: oneButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        decimalButton.setTitle(".", forState: .Normal)
        equalButton.frame = CGRect(x: decimalButton.frame.maxX, y: oneButton.frame.maxY, width: buttonWidth, height: buttonHeight)
        equalButton.setTitle("=", forState: .Normal)
        
        self.view.addSubview(displayLabel)
        
        for button in allButtons {
            button.backgroundColor = buttonColor
            button.layer.borderColor = UIColor.darkGrayColor().CGColor
            button.layer.borderWidth = 0.6
            //button.titleLabel?.font = UIFont.systemFontOfSize(buttonFontSize)
            button.titleLabel?.font = UIFont(name: fontName, size: buttonFontSize)
            self.view.addSubview(button)
        }
        
        for button in numberButtons {
            button.addTarget(self, action: "didTapNumber:", forControlEvents: .TouchUpInside)
        }
        
        for button in operatorButtons {
            button.backgroundColor = UIColor.orangeColor()
            button.addTarget(self, action: "didTapOperator:", forControlEvents: .TouchUpInside)
        }
        
        //assign button actions
        clearButton.addTarget(self, action: "didTapClear:", forControlEvents: .TouchUpInside)
        decimalButton.addTarget(self, action: "didTapDecimal", forControlEvents: .TouchUpInside)
        plusMinusButton.addTarget(self, action: "didTapPlusMinus:", forControlEvents: .TouchUpInside)
        percentButton.addTarget(self, action: "didTapPercent", forControlEvents: .TouchUpInside)
        
    } //end layoutButtons
    
    func updateDisplay(str:String) {
        displayLabel.text = str
    }
    
    func didTapNumber(sender: UIButton) {
        if let currentDisplay = displayLabel.text {
            if let currentButton = sender.titleLabel?.text {
                let previousDisplay = tappingNumbers ? currentDisplay : ""
                updateDisplay(previousDisplay + currentButton)
                tappingNumbers = true
            }
        }
    }
    
    
    func didTapDecimal() {
        if let currentDisplay = displayLabel.text {
            let previousDisplay = tappingNumbers ? currentDisplay : "0"
            if tappingNumbers {
                println("you are in the middle of tapping numbers")
                if currentDisplay.rangeOfString(".") == nil {
                    updateDisplay(previousDisplay + ".")
                } else {
                    println("you already have a decimal")
                }
            } else {
                println("fresh start")
                updateDisplay(previousDisplay + ".")
            }
            
            tappingNumbers = true
        }
    }
    
    func didTapOperator(sender: UIButton) {
        if let currentOperator = sender.titleLabel?.text {
            if let displayString = displayLabel.text {
                if tappingNumbers {
                    tappingNumbers = false
                    var newDisplay = calculator.updateEquation(convertToDouble(displayString))
                    updateDisplay(convertToText(newDisplay))
                } else {
                    println("Not tapping numbers")
                }
                calculator.updateOperator(currentOperator)
            }
        }
    }
    
    func didTapClear(sender: UIButton) {
        tappingNumbers = false
        if let currentClear = sender.titleLabel?.text {
            if currentClear == "C" {
                sender.setTitle("AC", forState: .Normal)
                displayLabel.text = "0"
            } else {
                sender.setTitle("C", forState: .Normal)
                calculator.allClear()
            }
        }
    }
    
    func didTapPlusMinus(sender: UIButton) {
        if let currentDisplay = displayLabel.text {
            var currentDouble = convertToDouble(currentDisplay)
            if currentDouble != 0 {
                currentDouble *= -1.0
                calculator.numberArray.append(currentDouble)
                updateDisplay(convertToText(currentDouble))
            }
            
        }
    }
    
    func didTapPercent() {
        if let currentDisplay = displayLabel.text {
            var newDisplay = convertToDouble(currentDisplay) / 100
            calculator.numberArray.append(newDisplay)
            updateDisplay(convertToText(newDisplay))
        }
    }
    
    // Data conversions
    func convertToDouble(str:String) -> Double {
        var displayDouble = (str as NSString).doubleValue
        
        return displayDouble
    }
    
    // Data conversions
    func convertToText(number:Double) -> String {
        var displayText = "\(number)"
        
        //remove .0 from string
        if displayText.hasSuffix(".0") {
            displayText = dropLast(dropLast(displayText))
        }
        
        return displayText
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

