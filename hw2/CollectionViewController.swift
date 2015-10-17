//
//  CollectionViewController.swift
//  hw2
//
//  Created by Philip Tibbetts on 10/7/15.
//  Copyright (c) 2015 Philip Tibbetts. All rights reserved.
//

import UIKit

let reuseIdentifier = "DayCell";


class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var tableData2 = [Day]();
    
    var numIndex : Int?;
    
    var firstTime = true;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (firstTime) {

        var newDay : Day?;
        
        for (var j = 1; j <= 31; ++j) {
            newDay = Day(Date: j);
            tableData2.append(newDay!);
            
        }
        
        
        // testing for now
        
        var events = [Event]();
        //var event1 : Event?;
        let event1 = Event(Name: "Special club", Time: "1200", Location: "Middleton");
        events.append(event1);
        
        let event2 = Event(Name: "Bar", Time: "1200", Location: "High Noon");
        events.append(event2);
        
        tableData2[3].Events = events;
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return tableData2.count
        }
        
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell: Cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! Cell
            cell.cellday.text = String(tableData2[indexPath.row].Date);
            return cell
        }
        
        func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            
            numIndex = indexPath.row;
            
            performSegueWithIdentifier("segger", sender: nil);
        }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {

            let myView = segue.destinationViewController as! TableViewController
            
            /*for (var i = 0; i < tableData2[numIndex!].Events!.count; ++i) {
                myView.events.append(tableData2[numIndex!].Events![i]);
            }*/
        //myView.events = tableData2[numIndex!].Events!;
        myView.whichDay = numIndex!;
        myView.days = tableData2;
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if (sender == nil) {
            return true;
        } else {
            return false;
        }
    }
    

}
