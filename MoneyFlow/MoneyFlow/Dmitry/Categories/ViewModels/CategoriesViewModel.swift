//
//  CategoriesViewModel.swift
//  MoneyFlow
//
//  Created by Dmitry on 25.03.2024.
//

import Foundation
import UIKit

class CategoriesViewModel {

    private weak var view: CategoriesVC?

    private var categories: [Category] {
        willSet {
            view?.updateDataSource(items: newValue)
        }
    }

    init(view: CategoriesVC? = nil, categories: [Category]) {
        self.view = view
        self.categories = categories
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.categories = [
                Category(name: "gfbe", image: UIImage(systemName: "map")!, subCategories: []),
                Category(name: "sdsf", image: UIImage(systemName: "map")!, subCategories: []),
                Category(name: "Рестораны", image: UIImage(systemName: "map")!, subCategories: []),
            ]
        }
    }
}
