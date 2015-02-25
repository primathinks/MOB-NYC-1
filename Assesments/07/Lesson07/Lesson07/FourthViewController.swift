//
//  FourthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var FourthTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readText()
    }
    
    func readText() {
        if let documentPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first as? NSURL {
            
            let filePath = documentPath.URLByAppendingPathComponent("sample.txt", isDirectory: false)
            
            if let fileContent = NSString(contentsOfURL: filePath, encoding: NSUTF8StringEncoding, error: nil) {
                FourthTextView.text = fileContent
            }
            
        } // end documentPath
    }
}
