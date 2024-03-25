//
//  CategoriesVC.swift
//  MoneyFlow
//
//  Created by Dmitry on 25.03.2024.
//

import Foundation
import UIKit

class CategoriesVC: UIViewController {

    let categoriesView = CategoriesView()

    override func loadView() {
        view = categoriesView
        view.backgroundColor = .white
        categoriesView.updateDataSource(items: [
            Category(name: "fsdf \(Int.random(in: 0...1000))", image: UIImage(systemName: "map")!),
            Category(name: "fsdf \(Int.random(in: 0...1000))", image: UIImage(systemName: "map")!),
            Category(name: "fsdf \(Int.random(in: 0...1000))", image: UIImage(systemName: "map")!)
        ])
    }
}
