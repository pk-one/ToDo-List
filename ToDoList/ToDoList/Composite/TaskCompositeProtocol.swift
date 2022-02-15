//
//  TaskCompositeProtocol.swift
//  ToDoList
//
//  Created by Pavel Olegovich on 15.02.2022.
//

import Foundation

protocol TaskComposite {
    var name: String { get }
    var date: Date { get }
}
