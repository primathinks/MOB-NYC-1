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
    
    var top1Constraint: NSLayoutConstraint?
    var top2Constraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 3"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        autolayout()
    }
    
    func autolayout() {
        var square1View = UIView()
        var square2View = UIView()
        var square3View = UIView()
        var square4View = UIView()
        
        square1View.setTranslatesAutoresizingMaskIntoConstraints(false)
        square2View.setTranslatesAutoresizingMaskIntoConstraints(false)
        square3View.setTranslatesAutoresizingMaskIntoConstraints(false)
        square4View.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.exerciseView.addSubview(square1View)
        self.exerciseView.addSubview(square2View)
        self.exerciseView.addSubview(square3View)
        self.exerciseView.addSubview(square4View)
        
        square1View.backgroundColor = UIColor.redColor()
        square2View.backgroundColor = UIColor.yellowColor()
        square3View.backgroundColor = UIColor.greenColor()
        square4View.backgroundColor = UIColor.purpleColor()
        
        // square1View constraints
        top1Constraint = NSLayoutConstraint(item: square1View, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: self.navMaxY)
        
        if let square1Top = top1Constraint {
            self.exerciseView.addConstraint(square1Top)
        }
        
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square1View, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square1View, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square1View, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20))
        
        // square2View constraints
        top2Constraint = NSLayoutConstraint(item: square2View, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: self.navMaxY)
        
        if let square2Top = top2Constraint {
            self.exerciseView.addConstraint(square2Top)
        }
        
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square2View, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square2View, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square2View, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20))
        
        // square3View constraints
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square3View, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -self.toolHeight))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square3View, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square3View, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square3View, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20))
        
        // square4View constraints
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square4View, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -self.toolHeight))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square4View, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.exerciseView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square4View, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: square4View, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20))
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    // handle view rotation
    // adjust upper-left and upper-right top constraints
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
