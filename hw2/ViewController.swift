//
//  ViewController.swift
//  hw2
//
//  Created by Philip Tibbetts on 10/7/15.
//  Copyright (c) 2015 Philip Tibbetts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //var events = [Event]();
    var whichDay : Int?;
    var days = [Day]();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let newEvent = Event();
        newEvent.Time = timeLabel.text!;
        newEvent.Location = locationLabel.text!;
        newEvent.Name = nameLabel.text!;
        
        self.days[whichDay!].Events!.append(newEvent);
        
        let myView = segue.destinationViewController as! TableViewController;
        //myView.events = self.events;
        myView.whichDay = self.whichDay;
        myView.days = self.days;
        
    }

    @IBOutlet weak var locationLabel: UITextField!
    
    @IBOutlet weak var nameLabel: UITextField!

    @IBOutlet weak var timeLabel: UITextField!
}

