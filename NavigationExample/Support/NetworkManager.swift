//
//  NetworkManager.swift
//  NavigationExample
//
//  Created by senthil on 07/10/26.
//

import SwiftUI
import Network

@Observable
final class NetworkManager {
    private let monitor = NWPathMonitor()
        private let queue = DispatchQueue(label: "NetworkMonitorQueue")
        
        var isConnected: Bool = true
        var isUsingCellular: Bool = false
        
        init() {
            monitor.pathUpdateHandler = { [weak self] path in
                Task { @MainActor [weak self] in
                    self?.isConnected = path.status == .satisfied
                    self?.isUsingCellular = path.usesInterfaceType(.cellular)
                }
            }
            monitor.start(queue: queue)
        }
        
        deinit {
            monitor.cancel()
        }
}
