//
//  ViewController.swift
//  MoneyFlow
//
//  Created by Dmitry on 24.03.2024.
//

import Foundation
import UIKit
import SwiftUI
import Combine

protocol AddOperationVCInterface: AnyObject {
    func submitOperation(type: OperationType, quantity: Double)
    func dismissScreen(animated: Bool)
}

class AddOperationVC: UIViewController, AddOperationVCInterface {

    //MARK: - Properties

    private let addOperationView = AddOperationView()
    private var viewModel: AddOperationViewModelInterface?
    private var subscriptions = Set<AnyCancellable>()

    //MARK: - Initialization

    init(viewModel: AddOperationViewModelInterface) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = addOperationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeOnViewModel()
        addOperationView.setDelegation(controller: self)
    }

    //MARK: - Logic

    func submitOperation(type: OperationType, quantity: Double) {
        viewModel?.saveOperation(with: type, quantity: quantity)
        dismiss(animated: true)
    }

    func dismissScreen(animated: Bool) {
        self.dismiss(animated: true)
    }

    //MARK: - Binding

    private func subscribeOnViewModel() {
        if let viewModel = viewModel as? AddOperationViewModel {
            viewModel.$category
                .compactMap{ $0 }
                .sink { [weak self] category in
                    self?.addOperationView.categoryCell.configureCell(category: category)
                }.store(in: &subscriptions)
        }
    }
}

extension AddOperationVC: CategoryCellDelegate {
    func cellTapped() {
        let controller = UIHostingController(rootView: SwiftUICategoriesView(delegate: self))
        show(controller, sender: nil)
    }
}

extension AddOperationVC: CategoriesViewDelegate {
    func categorySelected(category: Category) {
        self.dismiss(animated: true)
        viewModel?.setCurrentCategory(category)
    }
}

