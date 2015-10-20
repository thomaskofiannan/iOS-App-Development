//
//  ViewController.swift
//  Swift-CalculationDate
//
//  Created by Rohim Developer on 1/26/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var fromDate: UITextField!
    @IBOutlet weak var toDate: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var btnAction: UIButton!
    
    @IBOutlet weak var result2Label: UILabel!
    
    //
    var datePicker1:UIDatePicker!;
    var doneButton1:UIButton!

    var doneButton2:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = ""
        result2Label.text = ""
        
        //From Date
        
        var customView:UIView = UIView (frame: CGRectMake(0, 100, 320, 160));
        customView.backgroundColor = UIColor.whiteColor();
        
        datePicker1 = UIDatePicker(frame: CGRectMake(0, 0, 320, 160));
        customView .addSubview(datePicker1);
        datePicker1.datePickerMode = UIDatePickerMode.Date//to let date show M D Y
        fromDate.inputView = customView;
        doneButton1 = UIButton (frame: CGRectMake(100, 100, 100, 44));
        doneButton1.setTitle("Done", forState: UIControlState.Normal)
        doneButton1.addTarget(self, action: "fromDatePickerSelected", forControlEvents: UIControlEvents.TouchUpInside);
        doneButton1.backgroundColor = UIColor .brownColor();
        
        fromDate.inputAccessoryView = doneButton1;
        
        //To date
        toDate.inputView = customView;
        
        doneButton2 = UIButton (frame: CGRectMake(100, 100, 100, 44));
        doneButton2.setTitle("Done", forState: UIControlState.Normal)
        doneButton2.addTarget(self, action: "toDatePickerSelected", forControlEvents: UIControlEvents.TouchUpInside);
        doneButton2.backgroundColor = UIColor .brownColor();

        toDate.inputAccessoryView = doneButton2;
        
        
        
        
        
    }
    
    //-------------- Dob: Done Button Action ----------------------------------------
    func fromDatePickerSelected()
    {
        //dobTextField.text =  datePicker.date.description;
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        fromDate.text = dateFormatter.stringFromDate(datePicker1.date)
        
        fromDate.resignFirstResponder()
        doneButton1.resignFirstResponder()
    }
    
    func toDatePickerSelected()
    {
        //dobTextField.text =  datePicker.date.description;
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        toDate.text = dateFormatter.stringFromDate(datePicker1.date)
        
        toDate.resignFirstResponder()
        doneButton2.resignFirstResponder()
    }
    
    ///Action
    
    @IBAction func resutlAction(sender: AnyObject) {
        
        let start = fromDate.text
        let end = toDate.text
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let startDate:NSDate = dateFormatter.dateFromString(start)!
        let endDate:NSDate = dateFormatter.dateFromString(end)!
        
        let calendar = NSCalendar.currentCalendar()
        
       // Result 1
       //This statements will calculate exatly year , month and day from two date
        let days = calendar.components(.CalendarUnitDay,fromDate: startDate, toDate: endDate, options: nil).day
        let months = calendar.components(.CalendarUnitMonth, fromDate: startDate, toDate: endDate, options: nil).month
        let years = calendar.components(.YearCalendarUnit, fromDate: startDate, toDate: endDate, options: nil).year

        resultLabel.text = "Year: \(years) , Month: \(months) , Day: \(days)"
        
        
        // Result 2
        //To calculate two date
        let components = calendar.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: startDate, toDate: endDate, options: nil)
        
        
        println(components)
        result2Label.text = "Year: \(components.year) Month: \(components.month) Day: \(components.day)"
        
        

        
    }
    

}

