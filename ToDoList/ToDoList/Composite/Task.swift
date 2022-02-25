//
//  Task.swift
//  ToDoList
//
//  Created by Pavel Olegovich on 15.02.2022.
//

import Foundation
 
class Task: TaskComposite {
    var tasks: [TaskComposite] = []

    var name: String
    var date: Date
    
    var allTasks = [TaskComposite]()
    
    init(name: String, date: Date) {
        self.name = name
        self.date = date
    }
    
    func add(task: TaskComposite) {
        allTasks.append(task)
    }
}
