//
//  CategoriesManager.swift
//  MoneyFlow
//
//  Created by Dmitry on 25.03.2024.
//

import Foundation
import UIKit

class CategoriesManager {

    static let shared = CategoriesManager()

    func getAllCategories() -> [Category] {
        return [Category(name: "Еда \(Int.random(in: 0...1000))", image: UIImage(systemName: "map")!, subcategories: []),
                Category(name: "Жилье \(Int.random(in: 0...1000))", image: UIImage(systemName: "map")!, subcategories: []),
                Category(name: "Транспорт \(Int.random(in: 0...1000))", image: UIImage(systemName: "map")!, subcategories: [])
            ]
    }
}
