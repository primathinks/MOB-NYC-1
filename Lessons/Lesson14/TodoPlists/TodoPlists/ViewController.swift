//
//  ViewController.swift
//  TodoPlists
//
//  Created by Rudd Taylor on 2/23/15.
//  Copyright (c) 2015 ga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UIAlertViewDelegate {

    
    var items: [[String:String]] = [["name":"testing name", "content": "lorem ipsum"], ["name":"testing name2", "content":"testing name3"]]
    
    @IBAction func didSaveButton(sender: UIBarButtonItem) {
        if let string = NSBundle.mainBundle().pathForResource("ToDoList", ofType: "plist") {
        (items as NSArray).writeToFile(string, atomically: true)
    }
    }
    
    @IBAction func didTapAdd(sender: AnyObject) {
        var alert = UIAlertView(title: "Item Name?", message: "Enter an item name", delegate: self, cancelButtonTitle: "Dismiss", otherButtonTitles: "Add")
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex != alertView.cancelButtonIndex {
            if let textInAlert = alertView.textFieldAtIndex(0)?.text {
                //self.items.append(textInAlert)
                self.items.append(["name": textInAlert, "content": "not here yet"])
                self.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let documentPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first as? NSURL {
            if let string = NSBundle.mainBundle().pathForResource("ToDoList", ofType: "plist") {
                if let array = NSArray(contentsOfFile: string) {
                    items = array as Array
                    
                }
            }
            let filePath = documentPath.URLByAppendingPathComponent("ToDoList.plist", isDirectory: false)
            
            
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell") as UITableViewCell!
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "myCell")
        }
        var stringAtSpecifiedIndex = self.items[indexPath.row]["name"]
        var detailAtSpecifiedIndex = self.items[indexPath.row]["content"]
        cell.textLabel?.text = stringAtSpecifiedIndex
        cell.detailTextLabel?.text = detailAtSpecifiedIndex
        return cell
    }
}

