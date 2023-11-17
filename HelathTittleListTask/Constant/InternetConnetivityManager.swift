//
//  InternetConnetivityManager.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 17/11/23.
//

 import Foundation
import Reachability

class InternetConnectionManager {

    static let shared = InternetConnectionManager()

    private var reachability: Reachability!

    private init() {
        // Initialize Reachability
        reachability = try? Reachability()

        // Start monitoring for network changes
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(_:)), name: .reachabilityChanged, object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }

    deinit {
        // Stop monitoring for network changes when the object is deallocated
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }

    // Handle reachability changes
    @objc private func reachabilityChanged(_ notification: Notification) {
        guard let reachability = notification.object as? Reachability else { return }
        if reachability.connection != .unavailable {
            print("Internet is available")
        } else {
            print("Internet is not available")
        }
    }

    // Check if the internet connection is currently available
    func isInternetAvailable() -> Bool {
        return reachability.connection != .unavailable
    }
}
