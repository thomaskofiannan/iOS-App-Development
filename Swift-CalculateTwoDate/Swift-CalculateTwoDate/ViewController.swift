//
//  ViewController.swift
//  Swift-CalculateTwoDate
//
//  Created by Rohim Developer on 5/11/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        //current date is
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd-HH:mm:ss"
        
        
        let currentDateTime = dateFormatter.stringFromDate(NSDate())
        println("currentDateTime: \(currentDateTime)")
        
        let s_startDate = "2015/05/11-15:00:46"
        let startDate:NSDate = dateFormatter.dateFromString(s_startDate)!
 
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay | .CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond , fromDate: startDate, toDate: NSDate(), options: nil)
        
        //println(components)
        println("Year: \(components.year) Month: \(components.month) Day: \(components.day) Hour: \(components.hour) Minute: \(components.minute) Second: \(components.second)")
        
        
    }


}

