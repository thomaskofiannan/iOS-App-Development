//
//  NameTableViewController.swift
//  Swift-SQLite
//
//  Created by Rohim Developer on 2/2/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class NameTableViewController: UITableViewController, AddViewControllerDelegate {
    
    var nameArray = [String]()
    var genderArray = [String]()
    var idArray = [Int]()
    
    let db = SQLiteDB.sharedInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        deleteOldDatabase()
        
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return nameArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "Cell")
        }
        
        cell.textLabel?.text = nameArray[indexPath.row]
        cell.detailTextLabel?.text = genderArray[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
        let result = db.execute("DELETE FROM tblName WHERE id = \(idArray[indexPath.row])")
        
        if result != 0 {
            
            let alert = UIAlertView()
            alert.title = "remove Success"
            alert.addButtonWithTitle("Dismiss")
            alert.delegate = self
            alert.show()
            
        }
        
        fetchData()
        
        tableView.reloadData()
        
        
        
        
        
    }
    
    func fetchData(){
        
        nameArray.removeAll()
        genderArray.removeAll()
        idArray.removeAll()

        
        let data = db.query("select * from tblName")
        
        for (var i = 0; i < data.count ; i++) {
            
            let row = data[i]
            if let name = row["name"] {
                nameArray.append(name.asString())
            }
            
            if let gender = row["gender"] {
                genderArray.append(gender.asString())
            }
            
            if let id = row["id"] {
                idArray.append(id.asInt())
            }
            
        }
    
    }
    
    ///
    func addViewControllerDidCancel(controller: AddViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addViewController(conroller: AddViewController, withName name: String, withGender gender: String) {
        
        
        let result = db.execute("insert into tblName(name,gender,id) VALUES ('\(name)','\(gender)',\(nameArray.count))")
        
        if result != 0 {
            
            let alert = UIAlertView()
            alert.title = "Add Success"
            alert.addButtonWithTitle("Dismiss")
            alert.delegate = self
            alert.show()
            
        }
        
        fetchData()
        
        tableView.reloadData()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let nav = segue.destinationViewController as UINavigationController
        let controller = nav.topViewController as AddViewController
        
        controller.delegate = self
    }
    
    //======delete old database =======
    func documentDirectory() -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as [String]
        
        return paths[0]
    }
    func dataFilePath() -> String {
        
        return documentDirectory().stringByAppendingPathComponent("data1.db")
    }

    
    func deleteOldDatabase(){
        
        //1
        let path = dataFilePath()
        //2
        
        if NSFileManager.defaultManager().fileExistsAtPath(path){
            
            var fileManager = NSFileManager.defaultManager()
            fileManager.removeItemAtPath(path, error: nil)
            
        }
        
    }



}
