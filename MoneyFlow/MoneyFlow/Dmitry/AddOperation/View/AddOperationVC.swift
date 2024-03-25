//
//  ViewController.swift
//  MoneyFlow
//
//  Created by Dmitry on 24.03.2024.
//

import Foundation
import UIKit

class DmitryViewController: UIViewController {

    let addOperationView = AddOperationView()

    override func loadView() {
        view = addOperationView
        addOperationView.setController(controller: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func submitOperation(type: OperationType, quantity: Double) {
        print("\(type) \(quantity)")
        dismiss(animated: true)
    }

    
}

