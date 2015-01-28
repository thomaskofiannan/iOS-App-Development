//
//  openPDFinIbooksViewController.swift
//  DemoApp
//
//  Created by Rohim Developer on 1/13/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class openPDFinIbooksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func readPdfAction(sender: AnyObject) {

        
        if let path = NSBundle.mainBundle().pathForResource("book", ofType: "pdf") {
            if let targetURL = NSURL.fileURLWithPath(path) {
                
                let docController = UIDocumentInteractionController(URL: targetURL)
                let url = NSURL(string:"itms-books:");
                
                if UIApplication.sharedApplication().canOpenURL(url!) {
                
                    //docController.presentOpenInMenuFromRect(CGRectZero, inView: self.view, animated: true)
                    
                
                    println("iBooks is installed")
                
                    }else{
                    
                    println("iBooks is not installed")
                }
                
            }
        }
   

    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}
