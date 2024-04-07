//
//  CategoriesVC.swift
//  MoneyFlow
//
//  Created by Dmitry on 25.03.2024.
//

import Foundation
import UIKit
import Combine

class CategoriesVC: UIViewController {

    let categoriesView = CategoriesView()
    private var viewModel: CategoriesViewModelInterface?
    private var subscriptions = Set<AnyCancellable>()

    //MARK: - Initialization

    init(viewModel: CategoriesViewModelInterface) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = categoriesView
    }

    override func viewDidLoad() {
        subscribeOnViewModel()
    }

    deinit {
        subscriptions.removeAll()
    }

    //MARK: - Binding

    private func subscribeOnViewModel() {
        if let viewModel = viewModel as? CategoriesViewModel {
            viewModel.$categories
                .sink { categories in

                }.store(in: &subscriptions)
        }
    }
}
