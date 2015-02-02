//
//  NameClass.swift
//  Swift-PlistArrayOfObject
//
//  Created by Rohim Developer on 2/2/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import Foundation

class NameClass: NSObject,NSCoding {
    
    var firstName:String = ""
    var secondName:String = ""
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(firstName, forKey: "FirstName")
        aCoder.encodeObject(secondName, forKey: "SecondName")
    }
    
    required init(coder aDecoder: NSCoder) {
        firstName = aDecoder.decodeObjectForKey("FirstName") as String
        secondName = aDecoder.decodeObjectForKey("SecondName") as String
        
        super.init()
    }
    
    override init() {
        super.init()
    }
 
}
