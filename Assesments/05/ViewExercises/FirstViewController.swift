//
//  FirstViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FirstViewController: ExerciseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 1"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        // Box dimensions
        var borderWidth:CGFloat = 2.0
        var boxWidth:CGFloat = self.exerciseView.frame.width
        var boxHeight:CGFloat = 10.0
        
        /* TODO:
        Create a red box (10px tall, the width of the screen) with a black border on the very top of the screen below the nav bar,
        and a black box with a red border on the very bottom of the screen (same dimensions), above the toolbar.
        
        Use Springs & Struts.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        var redBox = UIView(frame: CGRect(x: 0, y: self.exerciseTop, width: boxWidth, height: boxHeight))
        redBox.backgroundColor = UIColor.redColor()
        redBox.layer.borderWidth = borderWidth
        redBox.layer.borderColor = UIColor.blackColor().CGColor
        self.exerciseView.addSubview(redBox)
        
        var blackBox = UIView(frame: CGRect(x: 0, y: self.exerciseBottom - boxHeight, width: boxWidth, height: boxHeight))
        blackBox.backgroundColor = UIColor.blackColor()
        blackBox.layer.borderWidth = borderWidth
        blackBox.layer.borderColor = UIColor.redColor().CGColor
        self.exerciseView.addSubview(blackBox)
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    func next() {
        self.performSegueWithIdentifier("two", sender: nil)
    }
}
