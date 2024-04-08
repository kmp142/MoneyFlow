//
//  MainViewModel.swift
//  MoneyFlow
//
//  Created by Ильмир Шарафутдинов on 04.04.2024.
//

import Foundation
import Combine
enum UserValidationError: Error {
    case incorrectCredentionals
}

class MainViewModel {
    
    @Published var isLoading: Bool = false
    @Published var cellDataSource: [MainCellViewModel] = []
    var dataSource: [Users]? = []
        
    private var cancellables = Set<AnyCancellable>()
    
//    var isLoading: Observable<Bool> = Observable(false)
//    var cellDataSource: Observable<[MainCellViewModel]> = Observable (nil)
//    var dataSource: [Users]?
    
    private var userValidationResult: Result<Expenses, Error>? {
        didSet {
            guard let result = userValidationResult else { return }
            userValidationResultBlock?(result)
        }
    }
    
    var userValidationResultBlock: ((Result<Expenses, Error>) -> Void)?
    func numbersOfRows(_ sections: Int) -> Int {
        dataSource?.count ?? 0
    }
    
    func getUsers() {
            isLoading = true
            
            NetworkDataFetch.shared.fetchUsers { [weak self] users, error in
                guard let self = self else { return }
                self.isLoading = false
                if let users = users {
                    self.dataSource = users
                    self.mapCellData()
                }
            }
        }

    func mapCellData() {
        cellDataSource = dataSource?.compactMap({ MainCellViewModel($0) }) ?? []
    }

//
//    func getUsers() {
//        isLoading.value = true
//
//        NetworkDataFetch.shared.fetchUsers { [weak self] users, error in
//            guard let self else { return }
//            self.isLoading.value = false
//            if let users {
//                self.dataSource = users
//                mapCellData()
//            }
//        }
//    }
//
//
//
//    func mapCellData() {
//        cellDataSource.value = dataSource?.compactMap({ MainCellViewModel($0)})
//    }
}
