//
//  EditDetailViewController.swift
//  Assignment 8
//
//  Created by Jason Michael Miletta on 4/1/15.
//  Copyright (c) 2015 Jason Michael Miletta. All rights reserved.
//

import UIKit

class EditDetailViewController: UIViewController, changedDeadlineDelegate{
 
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var statusSwitch: UISwitch!
    var deadline: NSDate?
    
    var detailItem: Task?
    var delegate: TaskChangedDelegate?
    var index: Int = -1
    
    func configureView(){
        nameTextField.text = detailItem?.taskName
        statusSwitch.setOn(detailItem!.status, animated: false)
        deadline = detailItem?.deadline
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    func changeDeadline(deadline: NSDate) {
        print("Deadline changed")
        self.deadline = deadline
        delegate?.taskChanged(Task(arg:(nameTextField.text!, statusSwitch.on, deadline)), index: index)
    }
   
    
    @IBAction func nameLabelDidEndEditing(sender: UITextField) {
        var text: String
        if let t = sender.text{
            text = t
        }
        else{
            text = ""
        }
        var date: NSDate
        if let d = deadline{
            date = d
        }
        else{
            date = NSDate()
        }
        let editedTask = Task(arg:(text, status: statusSwitch.on, deadline: date))
        
        delegate?.taskChanged(editedTask, index: index)
    }
    
    @IBAction func switchDidChange(sender: UISwitch) {
        var text: String
        if let t = nameTextField.text{
            text = t
        }
        else{
            text = ""
        }
        var date: NSDate
        if let _ = deadline {
            date = deadline!
        }
        else{
            date = NSDate()
        }
        let editedTask = Task(arg:(text, status: sender.on, deadline: date))
        
        print("Switch changed, calling delegate: ")
        delegate?.taskChanged(editedTask, index: index)
    }

    
    @IBAction func showDeadlinePicker(sender: UIButton) {
        print("Button")
        self.view.endEditing(true)
        let changeDeadlineController = ChangeDeadlineViewController()
        changeDeadlineController.delegate = self
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            print("IPAD")
            let popover = UIPopoverController(contentViewController: changeDeadlineController)
            popover.popoverContentSize = CGSize(width: 320, height: 280)
            popover.presentPopoverFromRect(sender.frame, inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
        }
        else{
            print("not ipad")
            self.presentViewController(changeDeadlineController, animated: true, completion: nil)
        }
    }
    @IBAction func tap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
}