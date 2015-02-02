//
//  ViewController.swift
//  Swift-StartUpWithCoreData
//
//  Created by Rohim Developer on 2/1/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //var names = [String]()
    
    
    //NSManagedObject think like row. one row == one object
    //think coredata: Entity as class, atribute as property
    //so each row of Entitiy can be assumed as object
    //but object of Entity, we use NSManagedObject
    var names = [NSManagedObject]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\"The List\""
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
        let person = names[indexPath.row]
        cell.textLabel?.text = person.valueForKey("name") as String?
        
        return cell
    }
    
    
    @IBAction func addAction(sender: AnyObject) {
        
        var alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .Alert)
        
        //add Textfield to alert
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
            
        }
        //save action
        var saveAction = UIAlertAction(title: "Save", style: .Default) { (action: UIAlertAction!) -> Void in
            let textField = alert.textFields![0] as UITextField
            self.saveName(textField.text)
            self.tableView.reloadData()
        }
        //cancel action
        var cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)

        
        presentViewController(alert, animated: true, completion: nil)

        
    }
    
    func saveName(name: String) {
        //1
        //to connect with core data we need to contact with
        //managedObjectContext
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        //find the table
        let entity =  NSEntityDescription.entityForName("Person",
            inManagedObjectContext:
            managedContext)
        
        //find row
        let person = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        
        //3
        
        //set each row with value
        person.setValue(name, forKey: "name")
        
        //4
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }  
        //5
        // add row to array of row or NSManagedObject
        names.append(person)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchData()

    }
    
    func fetchData(){
        
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        //fetch table name
        let fetchRequest = NSFetchRequest(entityName:"Person")
        
        //3
        var error: NSError?
        
        //fetch all row from table and casting as array of row
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as [NSManagedObject]?
        
        if let results = fetchedResults {
            names = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == .Delete ) {
            
            //1
            let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            
            //2
            let managedContext:NSManagedObjectContext = appDelegate.managedObjectContext!
            
            //
            managedContext.deleteObject(names[indexPath.row] as NSManagedObject)
           
            //
            names.removeAtIndex(indexPath.row)
            
            //save
            managedContext.save(nil)

            // Tell the table view to animate out that row
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }


}

