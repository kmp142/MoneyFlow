//
//  Expenses.swift
//  MoneyFlow
//
//  Created by Ильмир Шарафутдинов on 24.03.2024.
//

import UIKit

struct Expenses: Hashable, Identifiable {
    let id: UUID = UUID()
    var title: String
    var secondTitle: String

}
