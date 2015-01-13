//
//  ViewController.swift
//  designUsingProgramaticInSwift
//
//  Created by Rohim Developer on 1/11/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Detect Screen size
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        
        
        //Create 1 label and 1 button
        let myFirstLabel = UILabel()
        let myFirstButton = UIButton()
        myFirstLabel.text = "I made a label on the screen #toogood4you"
        myFirstLabel.font = UIFont(name: "MarkerFelt-Thin", size: 45)
        myFirstLabel.textColor = UIColor.redColor()
        myFirstLabel.textAlignment = .Center
        myFirstLabel.numberOfLines = 5
        myFirstLabel.frame = CGRectMake(15, 54, 300, 500)
        myFirstButton.setTitle("✸", forState: .Normal)
        myFirstButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        myFirstButton.frame = CGRectMake(15, -50, 300, 500)
        myFirstButton.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(myFirstLabel)
        self.view.addSubview(myFirstButton)
        
        
        
        
    }
    
    func pressed(sender: UIButton!) {
        var alertView = UIAlertView();
        alertView.addButtonWithTitle("Ok");
        alertView.title = "title";
        alertView.message = "message";
        alertView.show();
    }


}

