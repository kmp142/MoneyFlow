//
//  Expense.swift
//  MoneyFlow
//
//  Created by Ильмир Шарафутдинов on 26.05.2024.
//

import Foundation
struct Expense: Identifiable {
    let id = UUID()
    let category: String
    let amount: Double
}
