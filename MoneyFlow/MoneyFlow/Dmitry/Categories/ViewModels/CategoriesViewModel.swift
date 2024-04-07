//
//  CategoriesViewModel.swift
//  MoneyFlow
//
//  Created by Dmitry on 25.03.2024.
//

import Foundation
import UIKit

protocol CategoriesViewModelInterface {
    func addCategories(categories: [Category])
}

class CategoriesViewModel: CategoriesViewModelInterface {

    @Published var categories: [Category] = []

    init(categories: [Category]) {
        self.categories = categories
    }

    func addCategories(categories: [Category]) {
        self.categories += categories
    }
}
