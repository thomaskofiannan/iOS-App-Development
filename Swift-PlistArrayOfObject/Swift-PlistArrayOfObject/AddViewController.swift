//
//  AddViewController.swift
//  Swift-PlistArrayOfObject
//
//  Created by Rohim Developer on 2/2/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var sendNameTextField: UITextField!
    
    
    @IBOutlet weak var saveBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.delegate = self
        sendNameTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveAction(sender: AnyObject) {
        
        let firstName = firstNameTextField.text
        let secondName = sendNameTextField.text
        
        let newName = NameClass()
        newName.firstName = firstName
        newName.secondName = secondName
        
        nameArray.append(newName)
        
        let alert = UIAlertView()
        alert.title = "Saved!"
        alert.message = "New name"
        alert.delegate = self
        alert.addButtonWithTitle("Dismiss")
        alert.show()
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }
    
    

    


}
