//
//  ViewFromProgramViewController.swift
//  DemoApp
//
//  Created by Rohim Developer on 1/13/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class ViewFromProgramViewController: UIViewController {
    
    
    @IBOutlet weak var testBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        testBtn.frame = CGRectMake(0, 0, 200, 10)
        
    }


}
