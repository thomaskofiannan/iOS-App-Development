//
//  SecondSubViewController.swift
//  Swift-OrientationWithVideo
//
//  Created by Rohim Developer on 2/2/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class SecondSubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.All.rawValue)
    }
    
    override func shouldAutorotate() -> Bool{
        return true
    }
    
    @IBAction func backAction(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
