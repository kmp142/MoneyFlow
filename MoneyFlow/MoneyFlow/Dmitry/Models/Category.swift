//
//  Category.swift
//  MoneyFlow
//
//  Created by Dmitry on 24.03.2024.
//

import Foundation
import UIKit

struct Category: Hashable {
    var name: String
    var image: UIImage
    var subcategories: [Category]
}
