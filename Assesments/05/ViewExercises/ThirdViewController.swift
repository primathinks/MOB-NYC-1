//
//  ThirdViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

/* TODO:
Build four blue squares, 20 points wide, one in each corner of the screen.
They must stay in their respective corners on device rotation.

Use Autolayout.

Your view should be in self.exerciseView, not self.view
*/

import UIKit

class ThirdViewController: ExerciseViewController {
    
    let squareUnit:CGFloat = 20.0
    let squareColor:UIColor = UIColor.blueColor()
    var top1Constraint: NSLayoutConstraint?
    var top2Constraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 3"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        autolayout()
    }
    
    func autolayout() {
        let square1View = UIView()
        let square2View = UIView()
        let square3View = UIView()
        let square4View = UIView()
        
        var squareViews:[UIView] = [square1View, square2View, square3View, square4View]
        
        for view in squareViews {
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
            view.backgroundColor = squareColor
            self.exerciseView.addSubview(view)
        }
        
        // square1View constraints
        // Top constraint will be re-calculated on rotation
        top1Constraint = NSLayoutConstraint(item: square1View, attribute: .Top, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Top, multiplier: 1.0, constant: self.navMaxY)
        if let square1Top = top1Constraint {
            self.exerciseView.addConstraint(square1Top)
        }
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square1View, attribute: .Left, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Left, multiplier: 1.0, constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square1View, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: squareUnit))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square1View, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: squareUnit))
        
        // square2View constraints
        // Top constraint will be re-calculated on rotation
        top2Constraint = NSLayoutConstraint(item: square2View, attribute: .Top, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Top, multiplier: 1.0, constant: self.navMaxY)
        if let square2Top = top2Constraint {
            self.exerciseView.addConstraint(square2Top)
        }
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square2View, attribute: .Right, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Right, multiplier: 1.0, constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square2View, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: squareUnit))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square2View, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: squareUnit))
        
        // square3View constraints
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square3View, attribute: .Bottom, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Bottom, multiplier: 1.0, constant: -self.toolHeight))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square3View, attribute: .Right, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Right, multiplier: 1.0, constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square3View, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: squareUnit))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square3View, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: squareUnit))
        
        // square4View constraints
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square4View, attribute: .Bottom, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Bottom, multiplier: 1.0, constant: -self.toolHeight))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square4View, attribute: .Left, relatedBy: .Equal, toItem: self.exerciseView, attribute: .Left, multiplier: 1.0, constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square4View, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: squareUnit))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square4View, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: squareUnit))
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    // Handle view rotation
    // Adjust upper-left and upper-right top constraints
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        let landscapeMode = size.width > size.height
        
        if landscapeMode {
            self.top1Constraint?.constant = 32.0
            self.top2Constraint?.constant = 32.0
        } else {
            self.top1Constraint?.constant = self.navMaxY
            self.top2Constraint?.constant = self.navMaxY
        }
    
    }
    
    func next() {
        self.performSegueWithIdentifier("four", sender: nil)
    }

}
