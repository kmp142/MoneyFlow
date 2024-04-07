//
//  ViewController.swift
//  MoneyFlow
//
//  Created by Dmitry on 24.03.2024.
//

import Foundation
import UIKit

class AddOperationVC: UIViewController {

    let addOperationView = AddOperationView()
    private var viewModel: AddOperationViewModelInterface?

    init(viewModel: AddOperationViewModelInterface) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = addOperationView
        addOperationView.setController(controller: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func submitOperation(type: OperationType, quantity: Double) {
        viewModel?.saveOperation(with: type, quantity: quantity)
        dismiss(animated: true)
    }
}

