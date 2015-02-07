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
    
    var squareUnit:CGFloat = 20.0
    var squareColor:UIColor = UIColor.blueColor()
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
            CGPoint(x: self.exerciseView.frame.maxX - squareUnit, y: self.toolMinY - squareUnit),
            CGPoint(x: 0, y: self.toolMinY - squareUnit)
        ]
        
        var squareColors:[UIColor] = [UIColor.redColor(), UIColor.yellowColor(), UIColor.greenColor(), UIColor.blueColor()]
        
        setOrigin(squareViews, originArray: squareOrigins)
        setSize(squareViews)
        setColor(squareViews, colorArray: squareColors)
        
        // add squareViews
        for view in squareViews {
            self.exerciseView.addSubview(view)
        }

    }
    
    func setOrigin(viewArray:Array<UIView>, originArray:Array<CGPoint>) {
        for (index, view) in enumerate(viewArray) {
            view.frame.origin = originArray[index]
        }
    }
    
    func setSize(viewArray:Array<UIView>) {
        for view in viewArray {
            view.frame.size = self.squareSize
        }
    }
    
    func setColor(viewArray:Array<UIView>, colorArray:Array<UIColor>) {
        for (index, view) in enumerate(viewArray) {
            view.backgroundColor = colorArray[index]
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    // handle view rotation
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        var squareViews:[UIView] = [square1View, square2View, square3View, square4View]
        let landscapeMode = size.width > size.height
        var topY = self.navMaxY
        var bottomY = size.height - self.toolHeight - squareUnit

        if landscapeMode {
            topY = 32.0
        }
        
        var squareOrigins:[CGPoint] = [
            CGPoint(x: 0, y: topY),
            CGPoint(x: size.width - squareUnit, y: topY),
            CGPoint(x: size.width - squareUnit, y: bottomY),
            CGPoint(x: 0, y: bottomY)
        ]
        
        setOrigin(squareViews, originArray: squareOrigins)
       
    }
    
    func next() {
        self.performSegueWithIdentifier("three", sender: nil)
    }
}
