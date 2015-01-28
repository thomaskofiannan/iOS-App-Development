//
//  ReadPdfViewController.swift
//  DemoApp
//
//  Created by Rohim Developer on 1/13/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class ReadPdfViewController: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("View didload : Read pdf vc")

        let mainBundle = NSBundle.mainBundle()
        if let url = mainBundle.URLForResource("book", withExtension: "pdf") {
            
            webView.loadRequest(NSURLRequest(URL: url))
            
        }else {
            let alert = UIAlertController(title: "Please try again!!", message: "There is no file...", preferredStyle: .Alert)
            
            let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
      
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
        
    }


}
