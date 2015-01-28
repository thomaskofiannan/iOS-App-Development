//
//  Checklist.swift
//  SmartChecklists
//
//  Created by Rohim Developer on 1/9/15.
//  Copyright (c) 2015 smart. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {
   
    var iconName: String
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        iconName = "No Icon"
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as String
        items = aDecoder.decodeObjectForKey("Items") as [ChecklistItem]
        iconName = aDecoder.decodeObjectForKey("IconName") as String
        super.init()
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "Name")
        aCoder.encodeObject(items, forKey: "Items")
        aCoder.encodeObject(iconName, forKey: "IconName" )
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items{
            
            if !item.checked {
                
                count += 1
                }
        
            }
        
        return count
    
    }
    
    
}