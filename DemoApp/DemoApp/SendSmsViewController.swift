//
//  SendSmsViewController.swift
//  DemoApp
//
//  Created by Rohim Developer on 1/25/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit
import MessageUI

class SendSmsViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func sendMessage(sender: AnyObject) {
        var messageVC = MFMessageComposeViewController()
        
        messageVC.body = "Hi";
        messageVC.recipients = ["+96597868518"]
        messageVC.messageComposeDelegate = self;
        
        self.presentViewController(messageVC, animated: false, completion: nil)
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        switch (result.value) {
        case MessageComposeResultCancelled.value:
            println("Message was cancelled")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultFailed.value:
            println("Message failed")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultSent.value:
            println("Message was sent")
            self.dismissViewControllerAnimated(true, completion: nil)
        default:
            break;
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: "temp_img")
        
        var lebel1 : UILabel = UILabel()
        lebel1.text = "Hi"
        lebel1.frame = CGRectMake(20, 100, 100, 40)
        lebel1.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(lebel1)
    }


}
