//
//  ViewController.swift
//  SmartChecklists
//
//  Created by Rohim Developer on 12/19/14.
//  Copyright (c) 2014 smart. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {
    
    var items : [ChecklistItem]
    
    var checklist: Checklist!
    
        required init(coder aDecoder: NSCoder) {
            
            items = [ChecklistItem] ()
            super.init(coder: aDecoder)
            
            loadChecklistItems()
            
            println("Documents folder is \(documentsDirectory())")
            println("Data file path is \(dataFilePath())")
        }
    
    func loadChecklistItems() {
        
        // 1
        let path = dataFilePath()
        
        // 2
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
        
        // 3
        let data = NSData(contentsOfFile: path)
        
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: data!)
        
        items = unarchiver.decodeObjectForKey("ChecklistItems") as [ChecklistItem]
        
        unarchiver.finishDecoding()
        }
    }
    
    //@IBOutlet weak var cellLabel: UILabel!//can't connect
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = checklist.name

    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem") as UITableViewCell
        let item = items[indexPath.row]
        
        configureTextForCell(cell, withChecklistItem: item)
        configureCheckmarkForCell(cell, withChecklistItem: item)
        
        return cell
        
        
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //remove from data model
        items.removeAtIndex(indexPath.row)
        
        //remove from table
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Right)
        saveChecklistItems()
       
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
           
            let item = items[indexPath.row]
            item.toggleChecked()
 
            configureCheckmarkForCell(cell, withChecklistItem: item)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        saveChecklistItems()
        
    }
    
    func configureCheckmarkForCell( cell : UITableViewCell, withChecklistItem item: ChecklistItem){
       
        let label = cell.viewWithTag(1001) as UILabel
        
        if item.checked {
            label.text = "✓"
        }else{
            label.text = ""
        }
    }
    
    func configureTextForCell (cell: UITableViewCell, withChecklistItem item: ChecklistItem){
        
        let label = cell.viewWithTag(1000) as UILabel
         label.text = item.text
    }

    
    
    func addItemViewControllerDidCancel(controller: AddItemViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addItemViewController(controller: AddItemViewController, didFinishAddingItem item: ChecklistItem) {
        
        let newRowIndex = items.count
        
        items.append(item)
        
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        
        saveChecklistItems()
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addItemViewController(controller: AddItemViewController, didFinishEditingItem item: ChecklistItem) {
        
        if let index = find(items ,item){
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            if let cell = tableView.cellForRowAtIndexPath(indexPath){
                configureTextForCell(cell, withChecklistItem: item)
            }
        }
        
        saveChecklistItems()
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "AddItem"{
            
            let navigationController = segue.destinationViewController as UINavigationController
            
            let controller = navigationController.topViewController as AddItemViewController
            
            controller.delegate = self
            
        }else if segue.identifier == "EditItem" {
            
            let navigationController = segue.destinationViewController as UINavigationController
            
            let controller = navigationController.topViewController as AddItemViewController
            
            controller.delegate = self
            
            if let indexpath = tableView.indexPathForCell(sender as UITableViewCell){
                controller.itemToEdit = items[indexpath.row]
            }

        }
    }
    
    //Locate document Directory
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as [String]
        
        return paths[0]
    }
    
    //Add Checklists.plist file to that path
    func dataFilePath() -> String{
        return documentsDirectory().stringByAppendingPathComponent("Checklists.plist")
        
    }
    
    //Save checklist
    func saveChecklistItems(){
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        
        archiver.encodeObject(items, forKey: "ChecklistItems")
        
        archiver.finishEncoding()
        
        data.writeToFile(dataFilePath(), atomically: true)
    }
}






