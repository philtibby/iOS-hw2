//
//  CollectionViewController.swift
//  hw2
//
//  Created by Philip Tibbetts on 10/7/15.
//  Copyright (c) 2015 Philip Tibbetts. All rights reserved.
//

import UIKit

let reuseIdentifier = "DayCell";

var tableData2 = [Day]();

var numIndex : Int?;

//var tableData: [String] = ["1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3"];
//var tableData: [String] = [];


class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newDay : Day?;
        
        for (var j = 1; j <= 31; ++j) {
            newDay = Day(Date: j);
            tableData2.append(newDay!);
            
        }
        
        // testing for now
        
        var events = [Event]();
        //var event1 : Event?;
        let event1 = Event(Name: "Strip club", Time: "1200", Location: "Middleton");
        events.append(event1);
        
        let event2 = Event(Name: "Bar", Time: "1200", Location: "High Noon");
        events.append(event2);
        
        tableData2[3].Events = events;

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
            //print("Cell \(indexPath.row) selected")
            //TableViewController.events = tableData2[indexPath.row].Events;
            
            numIndex = indexPath.row;
            
            let myCustomViewController: TableViewController = TableViewController(nibName: nil, bundle: nil);
            //myCustomViewController.events = tableData2[indexPath.row].Events!;
            for (var i = 0; i < tableData2[indexPath.row].Events!.count; ++i) {
                myCustomViewController.events.append(tableData2[indexPath.row].Events![i]);
            }
            
            print("segger is segging");
            
            performSegueWithIdentifier("segger", sender: nil);
        }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {

            let myView = segue.destinationViewController as! TableViewController
            
            for (var i = 0; i < tableData2[numIndex!].Events!.count; ++i) {
                myView.events.append(tableData2[numIndex!].Events![i]);
            }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if (sender == nil) {
            return true;
        } else {
            return false;
        }
    }
    

}
