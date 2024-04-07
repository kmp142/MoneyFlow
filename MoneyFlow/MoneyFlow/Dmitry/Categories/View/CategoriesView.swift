//
//  CategoriesView.swift
//  MoneyFlow
//
//  Created by Dmitry on 24.03.2024.
//

import Foundation
import UIKit

enum TableViewSection {
    case main
}

class CategoriesView: UIView, UITableViewDelegate {

    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.reuseIdentifire)
        return tv
    }()

    var dataSource: UITableViewDiffableDataSource<TableViewSection, Category>?

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(tableView)
        setupConstraints()
        setupDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDataSource() {
        dataSource = UITableViewDiffableDataSource<TableViewSection, Category>(tableView: tableView, cellProvider: {tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.reuseIdentifire, for: indexPath) as! CategoryCell
            cell.configureCell(category: Category(name: "Дом", image: UIImage(systemName: "map")!, subcategories: []))
            return cell
        })
        updateDataSource(items: [Category(name: "Дом", image: UIImage(systemName: "map")!, subcategories: [])])
    }

    func updateDataSource(items: [Category]) {
        var snapshot = NSDiffableDataSourceSnapshot<TableViewSection, Category>()
        snapshot.appendSections([TableViewSection.main])
        snapshot.appendItems(items)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

extension CategoriesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
