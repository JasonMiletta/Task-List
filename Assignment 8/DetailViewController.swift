//
//  DetailViewController.swift
//  Assignment 8
//
//  Created by Jason Michael Miletta on 4/1/15.
//  Copyright (c) 2015 Jason Michael Miletta. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, TaskChangedDelegate {

    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskStatusLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!

    var delegate: TaskChangedDelegate?
    var index: Int = -1
    
    var detailItem: Task? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.taskNameLabel {
                label.text = detail.taskName
            }
            if let label = self.taskStatusLabel {
                if detail.status{
                    label.text = "Yes"
                }
                else{
                    label.text = "No"
                }
            }
            if let label = self.deadlineLabel {
                let formatter = NSDateFormatter()
                formatter.dateFormat = "MMM dd, yyyy"
                label.text = formatter.stringFromDate(detail.deadline)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if detailItem == nil{
            let label = UILabel()
            label.text = "No current Task selected"
            label.textAlignment = NSTextAlignment.Center
            self.view = label
        }
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editDetail" {
                let object = detailItem
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! EditDetailViewController
                controller.delegate = self
                controller.detailItem = object
                controller.index = index
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
        
        }
    }

    @IBAction func editButton(sender: UIBarButtonItem) {
    }
    
    func taskChanged(task: Task, index: Int) {
        print("Detailview taskChanged")
        detailItem = task
        delegate?.taskChanged(task, index: index)
    }
}

