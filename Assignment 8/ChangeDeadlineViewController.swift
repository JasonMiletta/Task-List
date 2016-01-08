//
//  ChangeDeadlineViewController.swift
//  Assignment 8
//
//  Created by Jason Michael Miletta on 4/1/15.
//  Copyright (c) 2015 Jason Michael Miletta. All rights reserved.
//

import UIKit

class ChangeDeadlineViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker?
    var delegate: changedDeadlineDelegate?
    
    init() {
        super.init(nibName: "DatePicker", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func tap(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
 
    @IBAction func done(sender: UIButton) {
        delegate?.changeDeadline(datePicker!.date)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

protocol changedDeadlineDelegate{
    func changeDeadline(deadline: NSDate)
}
