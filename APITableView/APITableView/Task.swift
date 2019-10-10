//
//  TaskModel.swift
//  APITableView
//
//  Created by Kulyash Konyrova on 10/9/19.
//  Copyright © 2019 Kulyash Konyrova. All rights reserved.
//

import UIKit

class Tasks : Codable {
    let tasks : [Task]
    
    init(tasks: [Task]) {
        self.tasks = tasks
    }
}

class Task : Codable {
    let userId : Int
    let id : Int
    let title : String
    let completed : Bool
    
    init(userId : Int, id : Int, title : String, completed : Bool) {
        self.userId = userId
        self.id = id
        self.title = title
        self.completed = completed
    }
}
