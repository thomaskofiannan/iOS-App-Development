//
//  SearchTableViewController.swift
//  UISearchbar
//
//  Created by Rohim Developer on 1/23/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    var is_searching:Bool!   // It's flag for searching
    
    var dataArray:[String]!  // Its data array for UITableview
    var searchingDataArray:[String]! // Its data searching array that need for search result show
    
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        var image = UIImage(named: "button") as UIImage!
        
        self.navigationController?.navigationBar.setBackgroundImage(image,
            forBarMetrics: .Default)
        

        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;

        println("Screen height is: \(screenHeight)")
        
        tableView.rowHeight = 70
        
        if screenHeight == 568.0 {
            
           tableView.backgroundView = UIImageView(image: UIImage(named: "bg-blue-light"))
        } else if screenHeight == 667.0 {
            tableView.backgroundView = UIImageView(image: UIImage(named: "bg-white"))
        }
        
        
        
        
        //tableView.backgroundColor = UIColor.blackColor()
        
        
        searchBar.delegate = self
        
        is_searching = false
        dataArray = ["Apple", "Samsung", "iPHone", "iPad", "Macbook", "iMac" , "Mac Mini"]
        searchingDataArray = []

    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if is_searching == true{
            return searchingDataArray.count
        }else{
            return dataArray.count  //Currently Giving default Value
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        if is_searching == true{
            cell.textLabel!.text = searchingDataArray[indexPath.row] as String
        }else{
            cell.textLabel!.text = dataArray[indexPath.row] as String
        }
        
        cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
        cell.textLabel!.textColor = UIColor.whiteColor()
        //cell.textLabel!.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        
        return cell
    }

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text.isEmpty{
            
            println("Empty")
            is_searching = false
            tableView.reloadData()
        } else {

            println("Start Filter")
            is_searching = true
            searchingDataArray.removeAll()
            
            for var index = 0; index < dataArray.count; index++
            {
                var currentString = dataArray[index] as String

                if currentString.lowercaseString.rangeOfString(searchText.lowercaseString)  != nil {
                    
                    searchingDataArray.append(currentString)
                    
                }
            }
            tableView.reloadData()
        }
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }

}
