//
//  AboutUsViewController.swift
//  TestSiderMenu
//
//  Created by Rohim Developer on 1/27/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        addRightBarButtonWithImage(UIImage(named: "ic_notifications_black_24dp")!)
        title = "About Us"

        // Do any additional setup after loading the view.
    }


}
