//
//  ViewController.swift
//  Swift-NSUserDefaults
//
//  Created by Rohim Developer on 2/2/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var savebtn: UIBarButtonItem!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var name:String = "No Name"
    
    @IBAction func saveAction(sender: AnyObject) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("\(nameTextField.text)", forKey: "NAME")
        
        let alert = UIAlertView()
        alert.title = "Your name!!!"
        alert.message = "saved"
        alert.addButtonWithTitle("Ok")
        alert.delegate = self
        alert.show()
    }
    
    
    @IBAction func openActio(sender: AnyObject) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if let temp = defaults.objectForKey("NAME") as? String {
            name = temp
        }

        let alert = UIAlertView()
        alert.title = "Your name!!!"
        alert.message = name
        alert.addButtonWithTitle("Ok")
        alert.delegate = self
        alert.show()

    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        savebtn.enabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let oldText : NSString = nameTextField.text
        let newText : NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        savebtn.enabled = newText.length > 0
        
        return true
    }


}

