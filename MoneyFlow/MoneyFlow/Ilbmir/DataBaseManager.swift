//
//  DataBaseManager.swift
//  MoneyFlow
//
//  Created by Ильмир Шарафутдинов on 25.03.2024.
//

import UIKit

class DataBaseManager {
    
    static let shared = DataBaseManager()
    
    private var dataSource: [Expenses] = [Expenses(title: "Все расходы", secondTitle: "118 000"), Expenses(title: "Машина", secondTitle: "10 000"), Expenses(title: "Еда", secondTitle: "15 000"), Expenses(title: "Одежда", secondTitle: "5 000"), Expenses(title: "Другое", secondTitle: "10 000"), Expenses(title: "ЖКХ", secondTitle: "8 000"), Expenses(title: "Здоровье", secondTitle: "4 000"), Expenses(title: "Театры", secondTitle: "3 000"), Expenses(title: "Развлечения", secondTitle: "10 000"), Expenses(title: "Переводы", secondTitle: "20 000")]
    
    func getAllTasks() -> [Expenses] {
        return dataSource
    }
    
    func removeTask(at index: Int) {
        dataSource.remove(at: index)
    }
    
    func update<T: Hashable>(object: T) {
        guard let index = dataSource.firstIndex(where: { $0.id == (object as! Expenses).id }) else { return }
        dataSource.remove(at: index)
        dataSource.insert(object as! Expenses, at: index)
    }

    func insert(expenses: Expenses, at index: Int) {
        dataSource.insert(expenses, at: index)
    }
    
}
