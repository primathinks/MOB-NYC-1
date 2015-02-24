//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var FirstTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSUserDefaults.standardUserDefaults().setValue("Hello World", forKey: "test_string")
        NSUserDefaults.standardUserDefaults().setInteger(2015, forKey: "test_number")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let num = NSUserDefaults.standardUserDefaults().integerForKey("test_number")
        
        if let str = NSUserDefaults.standardUserDefaults().stringForKey("test_string") {
            FirstTextView.text = "\(str) \n\(num)"
        }
        
    }
}