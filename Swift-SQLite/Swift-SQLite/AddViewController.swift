//
//  AddViewController.swift
//  Swift-SQLite
//
//  Created by Rohim Developer on 2/2/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate : class {
    
    func addViewControllerDidCancel(controller: AddViewController)
    func addViewController(conroller: AddViewController, withName name: String, withGender gender:String)
    
}

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    weak var delegate : AddViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        genderTextField.delegate = self

        // Do any additional setup after loading the view.
    }

    
    @IBAction func saveAction(sender: AnyObject) {

        delegate?.addViewController(self, withName: "\(nameTextField.text)", withGender: "\(genderTextField.text)")
        
    }
    
    @IBAction func closeAction(sender: AnyObject) {
        
        delegate?.addViewControllerDidCancel(self)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.endEditing(true)
        
        return false
    }
    

}
