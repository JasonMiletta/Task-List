//
//  Task.swift
//  Assignment 8
//
//  Created by Jason Michael Miletta on 4/2/15.
//  Copyright (c) 2015 Jason Michael Miletta. All rights reserved.
//

import UIKit

class Task {
    var taskName: String
    var status: Bool
    var deadline: NSDate
    
    init(){
        taskName = "New Task"
        status = true
        deadline = NSDate()
    }
    
    init(arg:(name:String, status: Bool, deadline: NSDate)) {
        taskName = arg.name
        status = arg.status
        deadline = arg.deadline
    }
    
}
