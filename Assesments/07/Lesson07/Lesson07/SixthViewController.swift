
//
//  SixthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var SixthTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let documentPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first as? NSURL {
            
            let filePath = documentPath.URLByAppendingPathComponent("sample.plist", isDirectory: false)
            
            if let arrayFromFile = NSArray(contentsOfURL: filePath) {
                var stringArray = arrayFromFile as AnyObject as [String]
                let str = " ".join(stringArray)
                SixthTextView.text = str
            }
            
            
            
        } // end documentPath
    }
}
