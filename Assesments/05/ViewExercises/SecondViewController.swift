//
//  SecondViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

/* TODO:
Build four blue squares, 20 points wide, one in each corner of the screen.
They must stay in their respective corners on device rotation.

Use Springs & Struts.

Your view should be in self.exerciseView, not self.view
*/

import UIKit

class SecondViewController: ExerciseViewController {
    
    let squareUnit:CGFloat = 20.0
    let squareColor:UIColor = UIColor.blueColor()
    let squareSize:CGSize = CGSize(width: 20.0, height: 20.0)

    let square1View = UIView()
    let square2View = UIView()
    let square3View = UIView()
    let square4View = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 2"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        
        var squareViews:[UIView] = [square1View, square2View, square3View, square4View]
        
        var squareOrigins:[CGPoint] = [
            CGPoint(x: 0, y: self.navMaxY),
            CGPoint(x: self.exerciseView.frame.maxX - squareUnit, y: self.navMaxY),
            CGPoint(x: self.exerciseView.frame.maxX - squareUnit, y: self.exerciseView.frame.height - (self.toolHeight + squareUnit)),
            CGPoint(x: 0, y: self.exerciseView.frame.height - (self.toolHeight + squareUnit))
        ]
        
        setOrigin(squareViews, originArray: squareOrigins)
        setSizeColor(squareViews)
        
        square1View.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleRightMargin
        square2View.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleLeftMargin
        square3View.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleLeftMargin
        square4View.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleRightMargin
        
        for view in squareViews {
            self.exerciseView.addSubview(view)
        }
    }
    
    func setOrigin(viewArray:Array<UIView>, originArray:Array<CGPoint>) {
        for (index, view) in enumerate(viewArray) {
            view.frame.origin = originArray[index]
        }
    }
    
    func setSizeColor(viewArray:Array<UIView>) {
        for view in viewArray {
            view.frame.size = self.squareSize
            view.backgroundColor = self.squareColor
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    // Handle view rotation
    // Adjust upper-left and upper-right y origins
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        var squareViews:[UIView] = [square1View, square2View]
        let landscapeMode = size.width > size.height
        var topY = self.navMaxY
        
        if landscapeMode {
            topY = 32.0
        }
        
        for view in squareViews {
            view.frame.origin.y = topY
        }
        
    }
    
    func next() {
        self.performSegueWithIdentifier("three", sender: nil)
    }
}
