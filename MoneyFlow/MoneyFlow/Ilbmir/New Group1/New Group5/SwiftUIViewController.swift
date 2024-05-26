//
//  SwiftUIViewController.swift
//  MoneyFlow
//
//  Created by Ильмир Шарафутдинов on 26.05.2024.
//

import SwiftUI
import UIKit

class SwiftUIViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = MainView()
        let hostingController = UIHostingController(rootView: contentView)
        addChild(hostingController)
        hostingController.view.frame = self.view.bounds
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
