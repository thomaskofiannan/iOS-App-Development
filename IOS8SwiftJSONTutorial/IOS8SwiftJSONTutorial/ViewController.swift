//
//  ViewController.swift
//  IOS8SwiftJSONTutorial
//
//  Created by Arthur Knopper on 18/08/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  
    
    
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 1
    let urlAsString = "http://itunes.apple.com/search?term=metallica"
    
    let url = NSURL(string: urlAsString)!

    var request = NSURLRequest(URL: url)
    var dataFromWebserver = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
    
        if dataFromWebserver != nil{
            
            //Case 1
            //var json = JSON(data: dataFromWebserver!)
            //let name = json["results"][0]["artistId"].stringValue
            //let gender = json["results"][0]["artistName"].stringValue
            
            
            
            //timeLabel.text = gender
            //dateLabel.text = name
            
            //-------------------------------------------------
            
            //case 2 Check how many element
            var json = JSON(data: dataFromWebserver!)
            var jsonDic = json.count
            
            println("Json Dic i s \(jsonDic)")
            
            var jsonArrayC = json["resultCount"].count
            println("Json resultCount is: \(jsonArrayC)")
            
            var jsonArray = json["results"].count
            println("Json Array is: \(jsonArray)")

            var jsonDic2 = json["results"][0].count
            println("Json Dic 2 \(jsonDic2)")
            
            for var i = 0 ; i < json["results"].count; i++ {
                let name = json["results"][i]["artistName"]
                let collectionPrice = json["results"][i]["collectionPrice"]
                println("Array \(i) name: \(name)")
                println("Array \(i) collectionPrice: \(collectionPrice)")
            }
        }

  }

}

