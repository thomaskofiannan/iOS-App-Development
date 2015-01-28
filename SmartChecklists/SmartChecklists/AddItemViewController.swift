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
    
    var itemToEdit: ChecklistItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit {
            title = "Edit item"
            textField.text = item.text
            doneBarButton.enabled = true
        }
        
        tableView.rowHeight = 44
    }
    
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




