//
//  LeftTableViewController.swift
//  Slide Menu Controller
//
//  Created by Rohim Developer on 1/27/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class LeftTableViewController: UITableViewController {
    
    var mainViewController: UIViewController!
    
    var menuArray : [String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        menuArray = [
            "Home",
            "About Us",
            "Contact Us",
            "Information",
            "Setting"
        ]
        
        //change background of table view
        tableView.backgroundView = UIImageView(image: UIImage(named: "bg5"))
        tableView.backgroundColor = UIColor.clearColor()
        
        //Hide empty cell
        //var backgroundView = UIView(frame: CGRectZero)
        //self.tableView.tableFooterView = backgroundView
        
        //Hide empty cell and Last border of cell
        tableView.tableFooterView = UIView(frame: CGRectMake(0, 0, self.tableView.frame.size.width, 1))


    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return menuArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if cell == nil {
            
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        
        cell.backgroundColor = UIColor.clearColor()
        
        cell.textLabel?.text = menuArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()

        return cell
        
        
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        changeMianViewController(indexPath.row)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    func changeMianViewController(rowNumber: Int){
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch rowNumber {
        case 0:
            let home = storyboard.instantiateViewControllerWithIdentifier("home") as HomeViewController
            mainViewController = UINavigationController(rootViewController: home)
            self.slideMenuController()?.changeMainViewController(mainViewController, close: true)
            
        case 1:
            let about = storyboard.instantiateViewControllerWithIdentifier("aboutus") as AboutUsViewController
            
            mainViewController = UINavigationController(rootViewController: about)
            self.slideMenuController()?.changeMainViewController(mainViewController, close: true)
            
        case 2:
            let contact = storyboard.instantiateViewControllerWithIdentifier("contactus") as ContactUsViewController
            
            mainViewController = UINavigationController(rootViewController: contact)
            self.slideMenuController()?.changeMainViewController(mainViewController, close: true)
            
            
        case 3:
            let info = storyboard.instantiateViewControllerWithIdentifier("info") as InformationViewController
            
            mainViewController = UINavigationController(rootViewController: info)
            self.slideMenuController()?.changeMainViewController(mainViewController, close: true)
            
        case 4:
            let setting = storyboard.instantiateViewControllerWithIdentifier("setting") as SettingViewController
            
            mainViewController = UINavigationController(rootViewController: setting)
            self.slideMenuController()?.changeMainViewController(mainViewController, close: true)
   
            
            

        default:
            println("default")
            
        }
        
    }




}
