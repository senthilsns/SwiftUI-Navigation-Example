//
//  NavigationExampleApp.swift
//  NavigationExample
//
//  Created by senthil on 05/10/26.
//

import SwiftUI

@main
struct NavigationExampleApp: App {
    @State private var networkManager = NetworkManager()
    var body: some Scene {
        WindowGroup {
            FirstView()
                .environment(networkManager)
        }
    }
}
