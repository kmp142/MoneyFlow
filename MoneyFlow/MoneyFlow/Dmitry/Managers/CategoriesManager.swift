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

    static let defaultCategory = Category(id: UUID(), name: "Категория", image: UIImage(named: "categories")!, subcategories: [])

    func getAllCategories() -> [Category] {
        return [Category(id: UUID(), name: "Питание", image: UIImage(systemName: "fork.knife")!, subcategories: []),
                Category(id: UUID(), name: "Дом", image: UIImage(systemName: "house")!, subcategories: []),
                Category(id: UUID(), name: "Транспорт", image: UIImage(systemName: "bus")!, subcategories: []),
                Category(id: UUID(), name: "Еда вне дома", image: UIImage(systemName: "cup.and.saucer")!, subcategories: []),
                Category(id: UUID(), name: "Развлечения", image: UIImage(systemName: "gamecontroller")!, subcategories: []),
                Category(id: UUID(), name: "Одежда и обувь", image: UIImage(systemName: "tshirt")!, subcategories: []),
                Category(id: UUID(), name: "Автомобиль", image: UIImage(systemName: "car")!, subcategories: []),
                Category(id: UUID(), name: "Домашнее животное", image: UIImage(systemName: "pawprint")!, subcategories: []),
                Category(id: UUID(), name: "Дети", image: UIImage(systemName: "figure.child")!, subcategories: []),
                Category(id: UUID(), name: "Здоровье", image: UIImage(systemName: "heart")!, subcategories: []),
                Category(id: UUID(), name: "Красота и уход", image: UIImage(systemName: "sun.max")!, subcategories: []),
                Category(id: UUID(), name: "Путешествия", image: UIImage(systemName: "airplane")!, subcategories: []),
                Category(id: UUID(), name: "Техника", image: UIImage(systemName: "desktopcomputer")!, subcategories: []),
                Category(id: UUID(), name: "Услуги связи", image: UIImage(systemName: "antenna.radiowaves.left.and.right")!, subcategories: []),
                Category(id: UUID(), name: "Другое", image: UIImage(systemName: "ellipsis")!, subcategories: []),
            ]
    }
}
