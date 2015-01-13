//
//  AddItemViewController.swift
//  SmartChecklists
//
//  Created by Rohim Developer on 12/30/14.
//  Copyright (c) 2014 smart. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    
    func addItemViewControllerDidCancel (controller: AddItemViewController)
    func addItemViewController (controller: AddItemViewController, didFinishAddingItem item: ChecklistItem )
    
     func addItemViewController (controller: AddItemViewController, didFinishEditingItem item: ChecklistItem )
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate : AddItemViewControllerDelegate?
    
    //Dob
    var datePicker:UIDatePicker!;
    var doneButton:UIButton!
    
    var itemToEdit: ChecklistItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit {
            title = "Edit item"
            textField.text = item.text
            doneBarButton.enabled = true
        }
        
        //set datepicker inside textfield
        
        //dob
        
        var customView:UIView = UIView (frame: CGRectMake(0, 100, 320, 160));
        customView.backgroundColor = UIColor.whiteColor();
        
        datePicker = UIDatePicker(frame: CGRectMake(0, 0, 320, 160));
        customView .addSubview(datePicker);
        datePicker.datePickerMode = UIDatePickerMode.Date//to let date show M D Y
        textField.inputView = customView;
        doneButton = UIButton (frame: CGRectMake(100, 100, 100, 44));
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.addTarget(self, action: "datePickerSelected", forControlEvents: UIControlEvents.TouchUpInside);
        doneButton.backgroundColor = UIColor .brownColor();
        
        textField.inputAccessoryView = doneButton;
    }
    
    //=========function apply for datepicker=============

    func datePickerSelected()
    {
        //dobTextField.text =  datePicker.date.description;
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        textField.text = dateFormatter.stringFromDate(datePicker.date)
        
        doneBarButton.enabled = true
    }
    
    //===================================================
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        textField.becomeFirstResponder()
    }


    @IBAction func cancel(){
        
       // dismissViewControllerAnimated(true, completion: nil)
        delegate?.addItemViewControllerDidCancel(self);
    }
    
    @IBAction func done(){
        
       // dismissViewControllerAnimated(true, completion: nil)
        
        if let item = itemToEdit{
            item.text = textField.text
            
            delegate?.addItemViewController(self, didFinishEditingItem: item)
        }else{
            
            let item = ChecklistItem()
            item.text = textField.text
            item.checked = false
            
            delegate?.addItemViewController(self, didFinishAddingItem: item)
            
        }
        

    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        return nil
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let oldText : NSString = textField.text
        let newText : NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        println("Old text: \(oldText)")
        println("New text: \(newText)")
        
        doneBarButton.enabled = (newText.length > 0)
        
        return true
        
    }


}




