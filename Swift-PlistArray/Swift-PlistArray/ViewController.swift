//
//  ViewController.swift
//  Swift-PlistArray
//
//  Created by Rohim Developer on 2/2/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var nameArray : [String]!
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameArray = []
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadFile()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addAction(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Add New Name", message: "Name", preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler { (textFiled: UITextField!) -> Void in
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default) { (action: UIAlertAction!) -> Void in
            
            let textField = alert.textFields![0] as UITextField
            var newName = textField.text
            self.nameArray.append(newName)
            self.tableView.reloadData()
            self.saveFile()
        }
        alert.addAction(saveAction)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        
        if cell ==  nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
        cell.textLabel?.text = nameArray[indexPath.row]
        
        return cell
    }
    
    //======1) Locate document directory =======
    func documentDirectory() -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as [String]
        
        return paths[0]
    }
    //==== 2)
    func dataFilePath() -> String {
        
        return documentDirectory().stringByAppendingPathComponent("Name.plist")
    }
    
    //==== 3) Save file =========
    
    func saveFile() {

        let data = NSMutableData()

        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)

        archiver.encodeObject(nameArray, forKey: "name")
        archiver.finishEncoding()
        
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    //===== 4) Load Data From checklist
    
    func loadFile(){
        
        //1
        let path = dataFilePath()
        
        //2
        
        if NSFileManager.defaultManager().fileExistsAtPath(path){
            
            let data = NSData(contentsOfFile: path)
            let unarchiever = NSKeyedUnarchiver(forReadingWithData: data!)
            
            nameArray = unarchiever.decodeObjectForKey("name") as [String]
            
            unarchiever.finishDecoding()
            
        }
        
    }

}

