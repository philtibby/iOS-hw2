//
//  CollectionViewController.swift
//  hw2
//
//  Created by Philip Tibbetts on 10/7/15.
//  Copyright (c) 2015 Philip Tibbetts. All rights reserved.
//

import UIKit

let reuseIdentifier = "DayCell";

//var tableData: [String] = ["1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3","1", "2", "3"];
var tableData: [String] = [];


class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (var i = 1; i <= 31; ++i) {
            tableData.append(String(i));
        }
        
        print("This shit works");

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
            return tableData.count
        }
        
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell: Cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! Cell
            cell.cellday.text = tableData[indexPath.row]
            return cell
        }
        
        func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            print("Cell \(indexPath.row) selected")
        }
    
    //this is a comment

}
