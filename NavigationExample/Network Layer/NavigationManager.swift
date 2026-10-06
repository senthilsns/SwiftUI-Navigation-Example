//
//  NavigationManager.swift
//  POC
//
//  Created by senthil on 05/10/26.
//

import SwiftUI
import Combine

class NavigationManager: ObservableObject {
    @Published var path: [String] = []

    func navigate(to destination: String) {
        path.append(destination)
    }

    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func popTo(_ destination: String) {
        if let index = path.firstIndex(where: { $0 == destination }) {
            path.removeSubrange((index + 1)..<path.endIndex)
        }
    }

    func popToRoot() {
        path.removeAll()
    }
}
