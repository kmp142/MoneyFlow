//
//  Category.swift
//  MoneyFlow
//
//  Created by Dmitry on 24.03.2024.
//

import Foundation
import UIKit

struct Category: Hashable, Identifiable {
    var id: UUID
    var name: String
    var image: UIImage
    var subcategories: [Category]
}
