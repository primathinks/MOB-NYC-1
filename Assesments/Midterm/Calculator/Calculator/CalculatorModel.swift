//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Prima Prasertrat on 2/15/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class CalculatorModel: NSObject {
    
    var numberArray:[Double] = [0.0]
    var operatorArray = [String]()
    
    func updateEquation(currentDisplay:Double) -> Double {
        
        numberArray.append(currentDisplay)
        var newDisplay:Double = currentDisplay
        
        if numberArray.count > 2 {
            if let operandTwo = numberArray.last {
                
                //retrieve next to last element
                var operandOne = numberArray[numberArray.count - 2]
                newDisplay = performMath(operandOne, numTwo: operandTwo, operation: getCurrentOperator(), currentDisplay: currentDisplay)
            }
            numberArray.append(newDisplay)
        }
        
        return newDisplay
    }
    
    func performMath(numOne:Double, numTwo:Double, operation:String, currentDisplay:Double) -> Double {
        var result: Double
        
        switch operation {
            case "÷":
                result = numOne / currentDisplay
            case "×":
                result = numOne * currentDisplay
            case "+":
                result = numOne + currentDisplay
            case "−":
                result = numOne - currentDisplay
            default:
                result = currentDisplay
        }
        return result
    }
    
    func updateOperator(operation:String) {
        operatorArray.append(operation)
        println("operatorArray: \(operatorArray)")
    }
    
    func getCurrentOperator() -> String {
        var currentOperator = ""
        if let currentOperation = operatorArray.last {
            currentOperator = currentOperation
        }
        return currentOperator
    }
    
}
