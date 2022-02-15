//
//  TaskTableViewCell.swift
//  ToDoList
//
//  Created by Pavel Olegovich on 15.02.2022.
//

import Foundation
import UIKit

class TaskTableViewCell: UITableViewCell {
    
    static let cellId = "TaskTableViewCell"
    
    private lazy var nameLabel = createLabel(fontSize: 20)
    private lazy var countTasksLabel = createLabel(fontSize: 16)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.selectionStyle = .none
        self.addSubview(nameLabel)
        self.addSubview(countTasksLabel)
        
        nameLabel.text = "test name"
        countTasksLabel.text = "Подзадачи: 15"
    }
//
//    func configure(model: TaskModel) {
//
//    }
}


//MARK: - setConstraints
extension TaskTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            countTasksLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            countTasksLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            countTasksLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            countTasksLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
}
