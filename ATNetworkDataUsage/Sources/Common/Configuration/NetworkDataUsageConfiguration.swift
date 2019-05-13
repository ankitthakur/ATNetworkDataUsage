//
//  NetworkDataUsageConfiguration.swift
//  ATNetworkDataUsage
//
//  Created by Ankit Thakur on 29/04/19.
//

import Foundation

internal struct NetworkInterface {
    static let prefixWifi = "en0"
    static let prefixCellular = "pdp_ip0"
    static let prefixVPN = "utun0"
}

public enum NetworkTrafficName: String, Codable {
    case none
    case wifi // default for wifi is en0.
    case mobile // default for mobile is pdp_ip0.
    case cellularpdpip0 = "pdp_ip0"
    case wifien0 = "en0"
    case vpn_utun0 = "utun0"


    enum Key: CodingKey {
        case rawValue
    }

    enum CodingError: Error {
        case unknownValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(String.self, forKey: .rawValue)
        switch rawValue {
        case "wifi":
            self = .wifi // default for wifi is en0.
        case "mobile":
            self = .mobile // default for mobile is pdp_ip0.
        case "pdp_ip0":
            self = .cellularpdpip0
        case "en0":
            self = .wifien0
        case "utun0":
            self = .vpn_utun0
        default:
            self = .none
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .wifi:
            try container.encode("wifi", forKey: .rawValue)
        case .mobile:
            try container.encode("mobile", forKey: .rawValue)
        case .cellularpdpip0:
            try container.encode("pdp_ip0", forKey: .rawValue)
        case .wifien0:
            try container.encode("en0", forKey: .rawValue)
        case .vpn_utun0:
            try container.encode("utun0", forKey: .rawValue)
        default:
            try container.encode("none", forKey: .rawValue)
        }

    }
    
}
