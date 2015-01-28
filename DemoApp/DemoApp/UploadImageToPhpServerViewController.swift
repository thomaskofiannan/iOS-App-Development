//
//  UploadImageToPhpServerViewController.swift
//  DemoApp
//
//  Created by Rohim Developer on 1/14/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class UploadImageToPhpServerViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pickAction(sender: AnyObject) {
        
        println("Picker button click")
        
        var picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
        
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func uploadAction(sender: AnyObject) {
        
        let imageData :NSData = UIImageJPEGRepresentation(imageView.image, 90)
        
        var response : NSString = UploadPhoto.pushPhoto(imageData)
        
        //println("Resonse is: \(response)")
        
        var err: NSError?
        
        var data = response.dataUsingEncoding(NSUTF8StringEncoding)
        
        if let responseFromWebserver = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSDictionary {
            
            var json = JSON(responseFromWebserver)
            //println("Json is \(json)")
            
            var nameOfImage = json["success"].stringValue
            println("name of image is: \(nameOfImage)")
        }
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        
    }

    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("cancel picking image")
        
         picker.dismissViewControllerAnimated(true, completion: nil)
    }

    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
    
    
    //====Solution two Convert code to Swift ======
    //
    //        let imageData :NSData = UIImageJPEGRepresentation(imageView.image, 90)
    //
    //        println("println push photo")
    //
    //        //UploadPhoto.pushPhoto(imageData)
    //        let urlString : String = "http://pharmacy.smart-kw.com/img/upload.php"
    //
    //        println("start request")
    //
    //        var request = NSMutableURLRequest(URL: NSURL(fileURLWithPath: urlString)!)
    //        request.HTTPMethod = "POST"
    //
    //        println("Start boundaray")
    //
    //        let boundary : String = "---------------------------14737809831466499882746641449"
    //        let contentType : String = "multipart/form-data; boundary=\(boundary)"
    //        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
    //
    //        println("start body")
    //
    //        var body = NSMutableData()
    //        body.appendData(("\r\n--\(boundary)\r\n").dataUsingEncoding(NSUTF8StringEncoding)!)
    //        body.appendData(("Content-Disposition: form-data; name=\"userfile\"; filename=\".jpg\"\r\n").dataUsingEncoding(NSUTF8StringEncoding)!)
    //        body.appendData(("Content-Type: application/octet-stream\r\n\r\n").dataUsingEncoding(NSUTF8StringEncoding)!)
    //        body.appendData(NSData(data: imageData))
    //        body.appendData(("\r\n--\(boundary)--\r\n").dataUsingEncoding(NSUTF8StringEncoding)!)
    //        request.HTTPBody = body
    //
    //        println("start sendAsynchronousRequest")
    //
    //        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
    //            println("test")
    //        }
    
    //var returnData : NSData = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)!

}


