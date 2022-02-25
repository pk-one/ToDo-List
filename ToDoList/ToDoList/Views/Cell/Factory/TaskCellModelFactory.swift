//
//  TaskCellModelFactory.swift
//  ToDoList
//
//  Created by Pavel Olegovich on 15.02.2022.
//

import Foundation

class TaskCellModelFactory {
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy в HH:mm"
        return dateFormatter
    }()
    
    func getViewModel(task: TaskComposite) -> TaskCellViewModel {
        TaskCellViewModel.init(name: task.name, date: dateFormatter.string(from: task.date), countSubTusks: task.allTasks.count)
    }
}



