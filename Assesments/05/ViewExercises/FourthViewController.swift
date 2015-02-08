//
//  FourthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

/* TODO:
Build a scroll view that takes up the entire screen.

In the scroll view, place a blue box at the top (20px high, 10px horizontal margins with the screen, a very tall (1000+px, width the same as the screen) purple label containing white text in the middle, and a red box at the bottom (20px high, 10px horizontal margins with the screen). The scroll view should scroll the entire height of the content.

Use Autolayout.


Your view should be in self.exerciseView, not self.view.
*/


import UIKit

class FourthViewController: ExerciseViewController {

    var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 4"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        autoLayout()
    }
    
    func autoLayout() {
        
        var scrollWidth = self.exerciseView.frame.width
        var scrollHeight = self.toolMinY - self.navMaxY
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: self.navMaxY, width: scrollWidth, height: scrollHeight))
        
        //scrollView needs a view with fixed known dimensions
        var containerView = UIView(frame: CGRect(x: 0, y: 0, width: scrollWidth, height: 1040))
        scrollView.addSubview(containerView)
        scrollView.contentSize = containerView.bounds.size
        
        self.exerciseView.addSubview(scrollView)
        
        // scrollView content
        var blueBox = UIView()
        blueBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        blueBox.backgroundColor = UIColor.blueColor()
        
        var purpleLabel = UILabel()
        purpleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        purpleLabel.backgroundColor = UIColor.purpleColor()
        purpleLabel.text = "Cupcake Ipsum"
        purpleLabel.textColor = UIColor.whiteColor()
        purpleLabel.textAlignment = NSTextAlignment.Center
        
        var redBox = UIView()
        redBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        redBox.backgroundColor = UIColor.redColor()
        
        containerView.addSubview(blueBox)
        containerView.addSubview(purpleLabel)
        containerView.addSubview(redBox)
        
        // blueBox constraints
        containerView.addConstraint(NSLayoutConstraint(item: blueBox, attribute: .Top, relatedBy: .Equal, toItem: containerView, attribute: .Top, multiplier: 1.0, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: blueBox, attribute: .LeftMargin, relatedBy: .Equal, toItem: containerView, attribute: .LeftMargin, multiplier: 1.0, constant: 10))
        containerView.addConstraint(NSLayoutConstraint(item: blueBox, attribute: .RightMargin, relatedBy: .Equal, toItem: containerView, attribute: .RightMargin, multiplier: 1.0, constant: -10))
        containerView.addConstraint(NSLayoutConstraint(item: blueBox, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 20))
        
        // purpleLabel constraints
        containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Top, relatedBy: .Equal, toItem: blueBox, attribute: .Bottom, multiplier: 1.0, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Left, relatedBy: .Equal, toItem: containerView, attribute: .Left, multiplier: 1.0, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Right, relatedBy: .Equal, toItem: containerView, attribute: .Right, multiplier: 1.0, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: purpleLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 1000))
        
         // redBox constraints
        containerView.addConstraint(NSLayoutConstraint(item: redBox, attribute: .Top, relatedBy: .Equal, toItem: purpleLabel, attribute: .Bottom, multiplier: 1.0, constant: 0))
        containerView.addConstraint(NSLayoutConstraint(item: redBox, attribute: .LeftMargin, relatedBy: .Equal, toItem: containerView, attribute: .LeftMargin, multiplier: 1.0, constant: 10))
        containerView.addConstraint(NSLayoutConstraint(item: redBox, attribute: .RightMargin, relatedBy: .Equal, toItem: containerView, attribute: .RightMargin, multiplier: 1.0, constant: -10))
        containerView.addConstraint(NSLayoutConstraint(item: redBox, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 20))
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("five", sender: nil)
    }

}
