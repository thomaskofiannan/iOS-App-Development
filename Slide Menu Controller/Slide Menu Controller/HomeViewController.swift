//
//  HomeViewController.swift
//  Slide Menu Controller
//
//  Created by Rohim Developer on 1/27/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        addRightBarButtonWithImage(UIImage(named: "ic_notifications_black_24dp")!)
        
        title = "Home"

        // Do any additional setup after loading the view.
    }


}
