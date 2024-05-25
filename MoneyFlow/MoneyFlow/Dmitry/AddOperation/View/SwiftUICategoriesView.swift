//
//  SwiftUICategoriesView.swift
//  MoneyFlow
//
//  Created by Dmitry on 25.05.2024.
//

import Foundation
import SwiftUI

protocol  CategoriesViewDelegate: AnyObject {
    func categorySelected(category: Category)
}

struct SwiftUICategoriesView: View {

    weak var delegate: CategoriesViewDelegate?
    let categories = CategoriesManager.shared.getAllCategories()

    var body: some View {
        List(categories){ category in
            HStack {
                Text(category.name)
                Spacer()
                Image(uiImage: category.image)
            }.onTapGesture {
                delegate?.categorySelected(category: category)
            }
        }

    }

    
}

#Preview {
    SwiftUICategoriesView()
}
