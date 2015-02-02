//
//  LessonTableViewController.swift
//  SearchbarWithScope
//
//  Created by Rohim Developer on 1/28/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class LessonTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    var chapterArray = [Chapter]()
    
    var filterChapter = [Chapter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        chapterArray = [
        
            Chapter(category: "Chapter1", name: "Basic"),
            Chapter(category: "Chapter1", name: "Class"),
            Chapter(category: "Chapter1", name: "Object"),
            Chapter(category: "Chapter1", name: "UIMethod"),
            Chapter(category: "Chapter1", name: "Property"),
            
            Chapter(category: "Chapter2", name: "Variable"),
            Chapter(category: "Chapter2", name: "Type Safety"),
            Chapter(category: "Chapter2", name: "Struct"),
            Chapter(category: "Chapter2", name: "UIViewController"),
            
            Chapter(category: "Chapter3", name: "UITableView"),
            Chapter(category: "Chapter3", name: "UISearchbar"),
            Chapter(category: "Chapter3", name: "Xcode6"),
            Chapter(category: "Chapter3", name: "UIImage"),
            
            Chapter(category: "Chapter4", name: "Protocol"),
            Chapter(category: "Chapter4", name: "PickerImage"),
            Chapter(category: "Chapter4", name: "Dictionary"),
            Chapter(category: "Chapter4", name: "Array")
        
        ]
        
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if tableView == self.searchDisplayController!.searchResultsTableView {
            return filterChapter.count
        }else {
            return chapterArray.count
        }
        
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
        if tableView == self.searchDisplayController!.searchResultsTableView{
            
            let chapterName = filterChapter[indexPath.row]
            cell.textLabel!.text = chapterName.name
            
        }else {
            let chapterName = chapterArray[indexPath.row]
            cell.textLabel!.text = chapterName.name
        }
        
        return cell
    }
    
    //=== Search Function === 
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        
           //Detect scope
        
        let scopes = self.searchDisplayController?.searchBar.scopeButtonTitles as [String]
        
//        for item in scopes {
//            println(item)
//        }
//        
        //detect selected scope
        let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
        
        println(selectedScope)

        println("Start Searching")
        
        //filterContentForSearchText(searchString)
        filterContentForSearchText(searchString, scope: selectedScope)
        
        return true
    }
    
    // Filter 
    
    func filterContentForSearchText(searchText: String, scope: String) {
        
        println("Search Text: \(searchText)")
        
        filterChapter = chapterArray.filter({ (chapterObject : Chapter) -> Bool in
            
var scopeMacth = (scope == "All") || (scope == chapterObject.category)
            
            var strMatch = chapterObject.name.rangeOfString(searchText)
            
            return scopeMacth && strMatch  != nil
        })
        
        
    }
    
    //Function call when click on scope
       func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        
        println("Click on Scope")
        
        //Detect scope
        
        let scopes = self.searchDisplayController?.searchBar.scopeButtonTitles as [String]
        
        //        for item in scopes {
        //            println(item)
        //        }
        //
        //detect selected scope
        let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
        
        println(selectedScope)
        
        println("Start Searching")
        
        //filterContentForSearchText(searchString)
        filterContentForSearchText(self.searchDisplayController!.searchBar.text, scope: selectedScope)
        
        return true
        
    }
    
    
    


}
