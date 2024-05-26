//
//  ExpenseViewModel.swift
//  MoneyFlow
//
//  Created by Ильмир Шарафутдинов on 26.05.2024.
//

import Foundation
import Combine

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = [
            Expense(category: "Бензин", amount: 25000),
            Expense(category: "Продукты", amount: 45678),
            Expense(category: "Одежда", amount: 350000)
        ]
    }
