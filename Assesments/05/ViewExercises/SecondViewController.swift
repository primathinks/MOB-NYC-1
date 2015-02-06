//
//  SecondViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class SecondViewController: ExerciseViewController {
    
    var squareUnit:CGFloat = 20.0
    var squareColor:UIColor = UIColor.blueColor()
    
    let square1View = UIView()
    let square2View = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 2"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        var squareRight = CGRectGetMaxX(self.exerciseView.frame) - squareUnit
        
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen. 
        They must stay in their respective corners on device rotation. 
        
        Use Springs & Struts.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        square1View.frame = CGRect(x: 0, y: self.exerciseTop, width: squareUnit, height: squareUnit)
        square1View.backgroundColor = squareColor
        self.exerciseView.addSubview(square1View)
        
        square2View.frame = CGRect(x: squareRight, y: self.exerciseTop, width: squareUnit, height: squareUnit)
        square2View.backgroundColor = UIColor.redColor()
        self.exerciseView.addSubview(square2View)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        var portraitY = self.exerciseTop
        var landscapeY = self.exerciseTop - 32
        
        let landscapeMode = size.width > size.height
        
        if landscapeMode {
            println("Landscape Mode")
            self.square1View.frame.origin.y = landscapeY
            
        } else {
            self.square1View.frame.origin.y = portraitY
        }
       
    }
    
    func next() {
        self.performSegueWithIdentifier("three", sender: nil)
    }
}
