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
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults.setValue("The answer to life the universe and everything", forKey: "test_string")
        userDefaults.setInteger(42, forKey: "test_number")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let num = userDefaults.integerForKey("test_number")
        
        if let str = userDefaults.stringForKey("test_string") {
            FirstTextView.text = "\(str) \n\(num)"
        }
        
    }
}