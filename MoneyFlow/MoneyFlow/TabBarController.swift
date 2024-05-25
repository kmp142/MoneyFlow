//
//  TabBarController.swift
//  MoneyFlow
//
//  Created by Dmitry on 24.03.2024.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configureTabBar(viewControllers: UIViewController...) {
        delegate = self
        setViewControllers(viewControllers, animated: true)

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance

        guard let items = self.tabBar.items else { return }

        items[0].image = UIImage(systemName: "figure.walk")
        items[1].image = UIImage(systemName: "plus.app.fill")
        items[2].image = UIImage(systemName: "car")
    }
}

extension TabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is AddOperationVC {
            let defaultCategory = CategoriesManager.defaultCategory
            let addOperationVM = AddOperationViewModel(storage: WalletOperationsStorage.shared, category: defaultCategory)
            let addOperationVC = AddOperationVC(viewModel: addOperationVM)
            tabBarController.present(addOperationVC, animated: true)
            return false
        }
        return true
    }

}
