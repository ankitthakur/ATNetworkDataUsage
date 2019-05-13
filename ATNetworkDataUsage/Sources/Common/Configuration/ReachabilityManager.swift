//
//  ReachabilityManager.swift
//  ATNetworkDataUsage
//
//  Created by Ankit Thakur on 13/05/19.
//

import Foundation
import Reachability

final class ReachabilityManager {

    static let shared = ReachabilityManager()

    //Initializer access level change now
    fileprivate init() {}

    let reachability = Reachability()!

    func startManager() {
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("\(type(of: self)) -> Function: \(#function) -> Reachable via WiFi")
            } else {
                print("\(type(of: self)) -> Function: \(#function) -> Reachable via Cellular")
            }
        }
        reachability.whenUnreachable = { _ in
            print("\(type(of: self)) -> Function: \(#function) -> Not reachable")
        }

        do {
            try reachability.startNotifier()
        } catch {
            print("\(type(of: self)) -> Function: \(#function) -> Unable to start notifier")
        }
    }

}
