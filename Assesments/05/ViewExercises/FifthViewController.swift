//
//  FifthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

/* TODO:
Create a green button with a red border that says ‘Tap me!’ (50px by 50px), center it in the middle of the screen.
Once tapped, the button should animate up 20 pixels and turn red, then immediately back down 20 pixels and turn back to green. It should not be clickable while animating.

Use Autolayout.

Your view should be in self.exerciseView, not self.view
*/

import UIKit

class FifthViewController: ExerciseViewController {
    
    var centerYConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 5"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        autoLayout()
    }
    
    func autoLayout() {
        var button = UIButton()
        
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        styleButton(button, active: true)
        
        self.exerciseView.addSubview(button)
        
        // Button constraints
        self.exerciseView.addConstraint(NSLayoutConstraint(item: button, attribute: .CenterX, relatedBy: .Equal, toItem: self.exerciseView, attribute: .CenterX, multiplier: 1.0, constant: 0))
        
        // Y constraint is class member
        // Y constraint will be accessed by animation function
        centerYConstraint = NSLayoutConstraint(item: button, attribute: .CenterY, relatedBy: .Equal, toItem: self.exerciseView, attribute: .CenterY, multiplier: 1.0, constant: 0)
        if let buttonYConstraint = centerYConstraint {
            self.exerciseView.addConstraint(buttonYConstraint)
        }
        
        self.exerciseView.addConstraint(NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50))
        self.exerciseView.addConstraint(NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50))
        
        // Button action
        button.addTarget(self, action: "didTap:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func styleButton(button: UIButton, active: Bool) {
        var titleColor = UIColor.blackColor()
        var backgroundColor = UIColor.greenColor()
        
        if !active {
            titleColor = UIColor.whiteColor()
            backgroundColor = UIColor.redColor()
        }
        
        button.setTitle("Tap me!", forState: UIControlState.Normal)
        button.setTitleColor(titleColor, forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(9)
        button.backgroundColor = backgroundColor
        button.layer.borderColor = UIColor.redColor().CGColor
        button.layer.borderWidth = 2.0
    }
    
    func didTap(sender: UIButton) {
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            sender.enabled = false
            self.updateButton(sender, point: -20, active: false)
        }) { (finished) -> Void in
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.updateButton(sender, point: 0, active: true)
            }, completion: { (finished) -> Void in
                sender.enabled = true
            })
        }
    }
    
    // Update button style and position
    func updateButton(sender: UIButton, point: CGFloat, active: Bool) {
        self.centerYConstraint?.constant = point
        self.styleButton(sender, active: active)
        self.exerciseView.setNeedsUpdateConstraints()
        self.exerciseView.layoutIfNeeded()
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("six", sender: nil)
    }

}
