//
//  ViewController.swift
//  Swift-PlistArrayOfObject
//
//  Created by Rohim Developer on 2/2/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

var nameArray = [NameClass]()

class ViewController: UITableViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameArray = []
        
        loadFile()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        let name = nameArray[indexPath.row]
        cell.textLabel?.text = name.firstName
        cell.detailTextLabel?.text = name.secondName
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        saveFile()
        tableView.reloadData()
    }
    
    
    //1)
    func documentDirectory() -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as [String]
        
        return paths[0]
    }
    //2)
    func dataFilePath() -> String {
        
        return documentDirectory().stringByAppendingPathComponent("Name.plist")
    }
    
    //3)
    
    func saveFile() {
        //this object will create file
        let data = NSMutableData()
        //this object will encode data
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        
        archiver.encodeObject(nameArray, forKey: "Name")
        archiver.finishEncoding()
        
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    //4)
    
    func loadFile(){
        
        //1
        let path = dataFilePath()
        //2
        
        if NSFileManager.defaultManager().fileExistsAtPath(path){
            
            let data = NSData(contentsOfFile: path)
            let unarchiever = NSKeyedUnarchiver(forReadingWithData: data!)
            
            nameArray = unarchiever.decodeObjectForKey("Name") as [NameClass]
            
            unarchiever.finishDecoding()
            
        }
        
    }
    



}

