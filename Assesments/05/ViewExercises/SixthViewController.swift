//
//  SixthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

/* TODO:
The table view cells on this screen are blank.

Add a label to each cell that is green and centered, and have its text say “Row {X}” (X is the row number of the cell). The tableview should rotate correctly. Use Autolayout.
*/

import UIKit

class SixthViewController: ExerciseViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 6"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.exerciseView.addSubview(tableView)
        self.tableView.frame = self.exerciseView.frame
        self.tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.navigationController!.navigationBar.frame), 0, 0, 0)
        
        // removes warning: Detected a case where constraints ambiguously suggest a height of zero...
        self.tableView.rowHeight = 44.0
        
        self.tableView.autoresizingMask = self.exerciseView.autoresizingMask
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
        var containerCell = UIView(frame: CGRect(x: 0, y: 0, width: cell!.contentView.frame.width, height: cell!.contentView.frame.height))
        containerCell.autoresizingMask = self.tableView.autoresizingMask
        
        var greenLabel = UILabel()
        greenLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        greenLabel.backgroundColor = UIColor.greenColor()
        greenLabel.text = "Row \(indexPath.row + 1)"
        greenLabel.textColor = UIColor.whiteColor()
        greenLabel.textAlignment = NSTextAlignment.Center
        
        containerCell.addSubview(greenLabel)
        
        // greenLabel constraints
        containerCell.addConstraint(NSLayoutConstraint(item: greenLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: containerCell, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0))
        containerCell.addConstraint(NSLayoutConstraint(item: greenLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: containerCell, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0))
        containerCell.addConstraint(NSLayoutConstraint(item: greenLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 100))
        containerCell.addConstraint(NSLayoutConstraint(item: greenLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 44))
        
        cell!.contentView.addSubview(containerCell)
        
        return cell!
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
}
