//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var ThirdTextView: UITextView!
    
    @IBAction func didTapNext(sender: AnyObject) {
        println("saveText")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveText()
    }
    
    func saveText() {
        if let documentPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first as? NSURL {
            
            let filePath = documentPath.URLByAppendingPathComponent("sample.txt", isDirectory: false)
            let displayText = NSString(string: ThirdTextView.text)
            
            displayText.writeToURL(filePath, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
            
        } // end documentPath
    }
}
