//
//  UIKitView.swift
//  MoneyFlow
//
//  Created by Ильмир Шарафутдинов on 26.05.2024.
//

import SwiftUI
import UIKit

struct UIKitView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIHostingController(rootView: UIKitContentView())
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct UIKitContentView: View {
    var body: some View {
        Text("Использование UIKit")
            .padding()
    }
}

struct UIKitView_Previews: PreviewProvider {
    static var previews: some View {
        UIKitView()
    }
}
