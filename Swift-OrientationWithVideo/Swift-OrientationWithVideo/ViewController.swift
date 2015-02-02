//
//  ViewController.swift
//  Swift-OrientationWithVideo
//
//  Created by Rohim Developer on 2/2/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//



import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    override func shouldAutorotate() -> Bool{
        return true
    }


}

