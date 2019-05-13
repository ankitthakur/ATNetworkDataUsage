//
//  NetworkTraffic.swift
//  ATNetworkDataUsage
//
//  Created by Ankit Thakur on 29/04/19.
//

import Foundation

public struct NetworkTraffic: Codable {
    public var name: NetworkTrafficName
    public var recieved: Double
    public var sent: Double
    public var timestamp: TimeInterval = 0
    public var ssid: String = ""
    public var carrierName: String = ""
    public var reachabilityConnection: NetworkTrafficName = .none


    internal enum NetworkTrafficKeys: String, CodingKey {
        case name
        case recieved
        case sent
        case timestamp
        case ssid
        case carrierName
        case reachabilityConnection
    }

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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: NetworkTrafficKeys.self)
        name = try container.decodeIfPresent(NetworkTrafficName.self, forKey: .name) ?? .none
        recieved = try container.decodeIfPresent(Double.self, forKey: .recieved) ?? 0.0
        sent = try container.decodeIfPresent(Double.self, forKey: .sent) ?? 0.0
        timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp) ?? 0.0
        ssid = try container.decodeIfPresent(String.self, forKey: .ssid) ?? ""
        carrierName = try container.decodeIfPresent(String.self, forKey: .carrierName) ?? ""
        reachabilityConnection =  try container.decodeIfPresent(NetworkTrafficName.self, forKey: .reachabilityConnection) ?? .none
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: NetworkTrafficKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(recieved, forKey: .recieved)
        try container.encodeIfPresent(sent, forKey: .sent)
        try container.encodeIfPresent(timestamp, forKey: .timestamp)
        try container.encodeIfPresent(ssid, forKey: .ssid)
        try container.encodeIfPresent(carrierName, forKey: .carrierName)
        try container.encodeIfPresent(reachabilityConnection, forKey: .reachabilityConnection)
    }


    public func jsonString() -> String? {
        do {
            let data = try JSONEncoder().encode(self)
            return String(data: data, encoding: .utf8) ?? ""
        } catch let error {
            print(error)
        }
        return nil

    }
}
