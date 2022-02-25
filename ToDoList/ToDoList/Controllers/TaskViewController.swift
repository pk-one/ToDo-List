//
//  TaskViewController.swift
//  ToDoList
//
//  Created by Pavel Olegovich on 15.02.2022.
//

import Foundation
import UIKit

class TaskViewController: UIViewController {
    
    var rootTask: TaskComposite!
    private let factory = TaskCellModelFactory()
    
//MARK: - ui components
    private lazy var tableView = createTableView()
    
//MARK: - Life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setNavBar()
        setConstraints()
        setDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
//MARK: - setupTableView
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.cellId)
    }
    
//MARK: - setNavBar
    private func setNavBar() {
        title = rootTask.name
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
//MARK: - setDelegates
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc private func addButtonTapped() {
        let alertController = UIAlertController(title: "Новая задача", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Опишите задачу"
        }
         
        let okButton = UIAlertAction(title: "Ok", style: .default) { _ in
            if let text = alertController.textFields?.first?.text, !text.isEmpty, text != " " {
                let newTask = Task(name: text, date: Date())
                self.rootTask?.allTasks.append(newTask)
                self.tableView.reloadData()
            }
        }
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
}

//MARK: - UITableViewDataSource
extension TaskViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rootTask?.allTasks.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.cellId, for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        let task = factory.getViewModel(task: rootTask.allTasks[indexPath.row])
        cell.configure(task: task)
        return cell
    }
}


//MARK: - UITableViewDelegate
extension TaskViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = rootTask.allTasks[indexPath.row]
        let taskVC = TaskViewController()
        taskVC.rootTask = task
        self.navigationController?.pushViewController(taskVC, animated: true)
    }
}

//MARK: - setConstraints
extension TaskViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

