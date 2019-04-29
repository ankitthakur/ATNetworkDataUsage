//
//  NetworkTraffic.swift
//  ATNetworkDataUsage
//
//  Created by Ankit Thakur on 29/04/19.
//

import Foundation

struct NetworkTraffic {
    var name: NetworkTrafficName
    var recieved: Double
    var sent: Double
    var timestamp: TimeInterval = 0
    var ssid: String = ""
    var carrierName: String = ""
    var reachabilityConnection: NetworkTrafficName = .none


    init(trafficName: NetworkTrafficName? = .none,
         recieved: Double? = 0,
         sent: Double? = 0) {
        self.name = trafficName ?? .none
        self.recieved = recieved ?? 0
        self.sent = sent ?? 0
        self.timestamp = Date().timeIntervalSince1970
    }

    mutating func updateInfo(name: NetworkTrafficName,
                             recieved: Double,
                             sent: Double,
                             ssid: String,
                             carrierName: String,
                             reachabilityConn: NetworkTrafficName) {
        self.name = name
        self.recieved = recieved
        self.sent = sent
        self.timestamp = Date().timeIntervalSince1970
        self.ssid = ssid
        self.carrierName = carrierName
        self.reachabilityConnection = reachabilityConn
    }
}
