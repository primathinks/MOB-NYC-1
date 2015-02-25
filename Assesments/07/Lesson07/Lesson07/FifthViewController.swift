//
//  FifthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var FifthTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let documentPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first as? NSURL {
            
            let filePath = documentPath.URLByAppendingPathComponent("sample.plist", isDirectory: false)
            
            let str = FifthTextView.text
            var displayArray = [""]
            for char in str {
                if char != " " {
                    var item = String(char)
                    displayArray.append(item)
                }
            }
          
            displayArray.removeAtIndex(0)
            (displayArray as NSArray).writeToURL(filePath, atomically: true)
            
        } // end documentPath
        
    }
}
