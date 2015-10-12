//
//  Events.swift
//  hw2
//
//  Created by Philip Tibbetts on 10/10/15.
//  Copyright © 2015 Philip Tibbetts. All rights reserved.
//

import UIKit

class Event : NSObject {
    
    var Name : String;
    var Time: String; // change this from String to something else at some point
    var Location: String;
    
    init (Name: String, Time: String, Location: String) {
        self.Name = Name;
        self.Time = Time;
        self.Location = Location;
    }

}

class Day : NSObject {
    
    var Date : Int;
    var Events : [Event]?;
    
    init (Date : Int) {
        self.Date = Date;
        self.Events = [Event]();
    }
    
    init (Date : Int, Events : [Event]) {
        self.Date = Date;
        self.Events = Events;
    }
    
}
