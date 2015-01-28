//
//  LeftViewController.swift
//  TestSiderMenu
//
//  Created by Rohim Developer on 1/27/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class LeftViewController: UITableViewController {
    
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
        
        //Hide empty cell
        var backgroundView = UIView(frame: CGRectZero)
        self.tableView.tableFooterView = backgroundView
        //self.tableView.backgroundColor = UIColor.blueColor()
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "bg5"))
        tableView.backgroundColor = UIColor.clearColor()



        // Do any additional setup after loading the view.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        changeMianViewController()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func changeMianViewController(){
        
        var aboutUsVC: UIViewController!
        var contactUsVC: UIViewController!
        var infoVC: UIViewController!
        var setVC: UIViewController!
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let aboutUs = storyboard.instantiateViewControllerWithIdentifier("aboutus") as AboutUsViewController
        aboutUsVC = UINavigationController(rootViewController: aboutUs)
        self.slideMenuController()?.changeMainViewController(aboutUsVC, close: true)
        
        
        
        



        
    }


}
