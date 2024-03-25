//
//  ViewController.swift
//  MoneyFlow
//
//  Created by Dmitry on 24.03.2024.
//

import Foundation
import UIKit

class IlmirViewController: UIViewController {
    
    let containerView = MoneyTableView()
    let dataBaseManager = DataBaseManager()
    
    var dataBase: [Expenses] = []
    var dataSource: UITableViewDiffableDataSource<Int, Expenses>?
    
    override func loadView() {
        view = containerView
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.tableView.delegate = self
        containerView.tableView.dataSource = self

    }
    
    func setupDataSource<T: Hashable>(items: [T]) {
        dataSource = UITableViewDiffableDataSource(tableView: containerView.tableView, cellProvider: { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: MoneyTableViewCell.reuseIdentifier, for: indexPath) as! MoneyTableViewCell
            
            if let expenses = item as? Expenses {
                cell.configureCell(with: expenses)
            }
            
            return cell
        })
        updateDataSource(with: dataBaseManager.getAllTasks())
    }
    func updateDataSource(with expenses: [Expenses]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Expenses>()
        snapshot.appendSections([0])
        snapshot.appendItems(expenses)
        dataSource?.apply(snapshot)
    }
    
}
extension IlmirViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBaseManager.getAllTasks().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoneyTableViewCell.reuseIdentifier, for: indexPath) as! MoneyTableViewCell
        let expenses = dataBaseManager.getAllTasks()[indexPath.row]
        cell.configureCell(with: expenses)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
}
