//
//  ViewController.swift
//  SmartChecklists
//
//  Created by Rohim Developer on 12/19/14.
//  Copyright (c) 2014 smart. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {
    
    var checklist: Checklist!

    
    //@IBOutlet weak var cellLabel: UILabel!//can't connect
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = checklist.name
        
        tableView.rowHeight = 44

    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklist.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem") as UITableViewCell
        
        let item = checklist.items[indexPath.row]
        
        configureTextForCell(cell, withChecklistItem: item)
        configureCheckmarkForCell(cell, withChecklistItem: item)
        
        return cell
        
        
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //remove from data model
        checklist.items.removeAtIndex(indexPath.row)
        
        //remove from table
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Right)
 
       
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
           
            let item = checklist.items[indexPath.row]
            item.toggleChecked()
 
            configureCheckmarkForCell(cell, withChecklistItem: item)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        
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
        
        let newRowIndex = checklist.items.count
        
        checklist.items.append(item)
        
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)

        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addItemViewController(controller: AddItemViewController, didFinishEditingItem item: ChecklistItem) {
        
        if let index = find(checklist.items ,item){
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            if let cell = tableView.cellForRowAtIndexPath(indexPath){
                configureTextForCell(cell, withChecklistItem: item)
            }
        }
        

        
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
                controller.itemToEdit = checklist.items[indexpath.row]
            }

        }
    }
    

}






