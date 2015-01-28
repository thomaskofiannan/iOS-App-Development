//
//  InformationViewController.swift
//  Slide Menu Controller
//
//  Created by Rohim Developer on 1/27/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        addRightBarButtonWithImage(UIImage(named: "ic_notifications_black_24dp")!)
        
        title = "Information"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
