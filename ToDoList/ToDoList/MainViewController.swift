//
//  ViewController.swift
//  ToDoList
//
//  Created by Pavel Olegovich on 15.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
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
//MARK: - setupTableView
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.cellId)
    }
//MARK: - setNavBar
    private func setNavBar() {
        title = "Tasks"
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButton
    }
//MARK: - setDelegates
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc private func addButtonTapped() {
        print("add")
    }
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.cellId, for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
            
        return cell
    }
}


//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tap")
    }
}

//MARK: - setConstraints
extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

