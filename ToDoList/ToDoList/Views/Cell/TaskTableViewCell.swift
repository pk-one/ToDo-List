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
    private lazy var dateTasksLabel = createLabel(fontSize: 16)
    private lazy var countSubTasksLabel = createLabel(fontSize: 30)
    
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
        self.addSubview(dateTasksLabel)
        self.addSubview(countSubTasksLabel)
    }
    
    func configure(task: TaskCellViewModel) {
        nameLabel.text = task.name
        dateTasksLabel.text = task.date
        countSubTasksLabel.text = "\(task.countSubTusks)"
    }
}


//MARK: - setConstraints
extension TaskTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75)
        ])
        
        NSLayoutConstraint.activate([
            dateTasksLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            dateTasksLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            dateTasksLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75),
            dateTasksLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            countSubTasksLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            countSubTasksLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}
