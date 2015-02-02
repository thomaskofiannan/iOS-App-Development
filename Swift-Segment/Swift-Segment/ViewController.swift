//
//  ViewController.swift
//  Swift-Segment
//
//  Created by Rohim Developer on 1/31/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openPDF("ch1")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func segmentAction(sender: AnyObject) {
        
        
        let segmentController = sender as UISegmentedControl
        
        switch segmentController.selectedSegmentIndex {
            
        case 0:
            openPDF("ch1")
            
        case 2:
            openPDF("ch2")

        case 3:
            openPDF("ch3")

        default:
            openPDF("ch4")

            
        }
        
    }
    
    func openPDF(pdf: String){
        let mainBundle = NSBundle.mainBundle()
        if let url = mainBundle.URLForResource(pdf, withExtension: "pdf") {
            
            webView.loadRequest(NSURLRequest(URL: url))
            
        }else {
            let alert = UIAlertController(title: "Please try again!!", message: "There is no file...", preferredStyle: .Alert)
            
            let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
    }


}

