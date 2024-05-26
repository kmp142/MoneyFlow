//
//  MainView.swift
//  MoneyFlow
//
//  Created by Ильмир Шарафутдинов on 26.05.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = ExpenseViewModel()

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    List {
                        ForEach(viewModel.expenses) { expense in
                            HStack {
                                Text(expense.category)
                                Spacer()
                                Text(String(format: "%.2f P", expense.amount))
                            }
                        }
                    }
                    .navigationTitle("Расходы")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: DetailsView()) {
                                Text("Детали")
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            NavigationLink(destination: UIKitView()) {
                                Text("Сюда")
                            }
                        }
                    }
                }
            }
        } else {
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

