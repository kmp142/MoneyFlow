//
//  MoneyTableView.swift
//  MoneyFlow
//
//  Created by Ильмир Шарафутдинов on 24.03.2024.
//

import UIKit

class MoneyTableView: UIView {
    
    lazy var tableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.register(MoneyTableViewCell.self, forCellReuseIdentifier: MoneyTableViewCell.reuseIdentifier)
        table.estimatedRowHeight = 200
        
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupLayouts()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(tableView)
    }
    
    private func setupLayouts() {
        backgroundColor = .white
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 250),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
