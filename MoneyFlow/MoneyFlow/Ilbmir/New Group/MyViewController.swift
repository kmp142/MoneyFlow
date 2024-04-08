//
//  MyViewController.swift
//  MoneyFlow
//
//  Created by Ильмир Шарафутдинов on 04.04.2024.
//

import UIKit
import Combine

class MyViewController: UIViewController {
    
    lazy var tableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
        table.estimatedRowHeight = 200
        
        return table
    }()
    let activityIndicator = UIActivityIndicatorView()
    
    var viewModel = MainViewModel()
    
    var cellDataSource = [MainCellViewModel]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getUsers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        setupSubviews()
        setupLayouts()
        setupConstraints()
        setupTableView()
        bindViewModel()
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
    }
    
    private func setupLayouts() {
        view.backgroundColor = .white
    }
    
    
    private var cancellables = Set<AnyCancellable>()
       
    private func bindViewModel() {
            // Привязка isLoading
            viewModel.$isLoading.sink { [weak self] isLoading in
                guard let self = self else { return }
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }.store(in: &cancellables)
            
            // Привязка cellDataSource
            viewModel.$cellDataSource.sink { [weak self] cellDataSource in
                self?.cellDataSource = cellDataSource
                self?.reloadTableView()
            }.store(in: &cancellables)
        }
    
//    private func bindViewModel() {
//        viewModel.isLoading.bind { [weak self] isLoading in
//            guard let self, let isLoading else { return }
//            DispatchQueue.main.async {
//                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
//            }
//        }
//        viewModel.cellDataSource.bind { [weak self] users in
//            guard let self, let users else { return }
//            cellDataSource = users
//            reloadTableView()
//        }
//    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension MyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        registerCell()
    }
    
    func registerCell() {
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numbersOfRows(section)
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainCell
//
//        if let expenses = viewModel.dataSource?[indexPath.row] {
//            cell.configureCell(with: expenses)
//        }
//
//        return cell
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier, for: indexPath) as? MainCell else { return UITableViewCell() }
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
