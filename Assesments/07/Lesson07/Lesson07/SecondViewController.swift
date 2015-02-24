//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondTextView: UITextView!
    
    //Go To Settings
    @IBAction func didTapSettings(sender: AnyObject) {
        if let appstr = UIApplicationOpenSettingsURLString {
            if let fileUrl = NSURL(string: appstr) {
                UIApplication.sharedApplication().openURL(fileUrl)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sliderValue = NSUserDefaults.standardUserDefaults().floatForKey("settings_slider")
        if let name = NSUserDefaults.standardUserDefaults().stringForKey("settings_name") {
            secondTextView.text = "Name: \(name) \nSlider Value: \(sliderValue)"
        } else {
            secondTextView.text = "Please update your settings."
        }
    }
    
}
