//
//  NetworkDataUsageConfiguration.swift
//  ATNetworkDataUsage
//
//  Created by Ankit Thakur on 29/04/19.
//

import Foundation

struct NetworkInterface {
    static let prefixWifi = "en0"
    static let prefixCellular = "pdp_ip0"
    static let prefixVPN = "utun0"
}

internal enum NetworkTrafficName: String {
    case none
    case wifi // default for wifi is en0.
    case mobile // default for mobile is pdp_ip0.
    case cellularpdpip0 = "pdp_ip0"
    case cellularpdpip1 = "pdp_ip1"
    case cellularpdpip2 = "pdp_ip2"
    case cellularpdpip3 = "pdp_ip3"
    case cellularpdpip4 = "pdp_ip4"
    case wifien0 = "en0"
    case wifien1 = "en1"
    case wifien2 = "en2"
    case wifien3 = "en3"
    case wifien4 = "en4"
    case vpn_utun0 = "utun0"
    case vpn_utun1 = "utun1"
    case vpn_utun2 = "utun2"
    case vpn_utun3 = "utun3"
    case vpn_utun4 = "utun4"
}
