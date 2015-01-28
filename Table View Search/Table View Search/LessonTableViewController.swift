//
//  LessonTableViewController.swift
//  Table View Search
//
//  Created by Rohim Developer on 1/23/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class LessonTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    var chapter = [Chapter]()
    
    var filteredChapter = [Chapter]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //populate data
//        let item1 = Chapter(category: "Chapter1", name: "Lesson1");
//        chapter.append(item1)
//        
//        let item2 = Chapter(category: "Chapter2", name: "Lesson2")
//        chapter.append(item2)
        
        chapter = [
            Chapter(category: "Chapter1", name: "Basic"),
            Chapter(category: "Chapter1", name: "Class"),
            Chapter(category: "Chapter1", name: "Object"),
            Chapter(category: "Chapter1", name: "Uethod"),
            Chapter(category: "Chapter2", name: "Variable"),
            Chapter(category: "Chapter2", name: "Type Safty"),
            Chapter(category: "Chapter2", name: "Struct"),
            Chapter(category: "Chapter2", name: "UIViewController"),
            Chapter(category: "Chapter3", name: "UItableViewController"),
            Chapter(category: "Chapter3", name: "UISearchbar"),
            Chapter(category: "Chapter3", name: "Xcode6"),
            Chapter(category: "Chapter3", name: "UIImageView"),
            Chapter(category: "Chapter4", name: "Protocole"),
            Chapter(category: "Chapter4", name: "PickerImage"),
            Chapter(category: "Chapter4", name: "Dictionary"),
            Chapter(category: "Chapter4", name: "Array")
            
        ]

    
        
        
        
//        var rectangle1 = RectangleClass()
//        
//        rectangle1.length = 12
//        
//        var rectangle2 = rectangle1
//        
//        rectangle2.length = 24
//        
//        println(rectangle1.length)
//        
//        println(rectangle2.length)

//        var rectangle1 = RectangleStruct()
//        
//        rectangle1.lenght = 12
//        
//        var rectangle2 = rectangle1
//        
//        rectangle2.lenght = 24
//        
//        println(rectangle1.lenght)
//        
//        println(rectangle2.lenght)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.searchDisplayController!.searchResultsTableView{
            return filteredChapter.count
        }else {
            return chapter.count
        }
    
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        var lesson : Chapter
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            lesson = filteredChapter[indexPath.row]
        }else {
            lesson = chapter[indexPath.row]
        }
        
        cell.textLabel!.text = lesson.name
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("lessondetail", sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     
        if segue.identifier == "lessondetail" {
            
            let lessonDetailViewController = segue.destinationViewController as UIViewController
            
            if sender as UITableView == self.searchDisplayController!.searchResultsTableView {
                
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow()!
                let destinationTitle = self.filteredChapter[indexPath.row].name
                lessonDetailViewController.title = destinationTitle
                
            } else {
                
                let indexPath = self.tableView.indexPathForSelectedRow()!
                let destinationTitle = self.chapter[indexPath.row].name
                lessonDetailViewController.title = destinationTitle
            }
        }
    }
    
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        
        filteredChapter = chapter.filter({ (chapter: Chapter) -> Bool in
            let categoryMatch = (scope == "All") || (chapter.category == scope)
            var stringMatch = chapter.name.rangeOfString(searchText)
            
            return categoryMatch && stringMatch != nil
        })
        
    }
    
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        
        let scopes = self.searchDisplayController?.searchBar.scopeButtonTitles as [String]
        
        let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
        
        filterContentForSearchText(searchString, scope: selectedScope)
        
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!,
        shouldReloadTableForSearchScope searchOption: Int) -> Bool {
            
            let scope = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
            
            println(self.searchDisplayController!.searchBar.text)
            
            filterContentForSearchText(self.searchDisplayController!.searchBar.text, scope: scope[searchOption])
            return true
    }


}
