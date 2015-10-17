//
//  TableViewController.swift
//  hw2
//
//  Created by Philip Tibbetts on 10/11/15.
//  Copyright © 2015 Philip Tibbetts. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //var events = [Event]();
    var whichDay : Int?;
    var days = [Day]();

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //let addButton = UIBarButtonSystemItem.Add;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days[whichDay!].Events!.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        let event = days[whichDay!].Events![indexPath.row];
        cell.textLabel!.text = "\(event.Name!) - \(event.Time!) - \(event.Location!)";
        return cell;
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            //print("Deleting");
            print(indexPath.row);
            days[whichDay!].Events!.removeAtIndex(indexPath.row);
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic);
            
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "newevent") {
            let myView = segue.destinationViewController as! ViewController;
            //myView.events = self.events;
            myView.whichDay = self.whichDay;
            myView.days = self.days;
        } else {
            let myView = segue.destinationViewController as! CollectionViewController;
            myView.tableData2 = self.days;
            myView.firstTime = false;
            print("segging");
        }
    }
    
    
    
    
}
