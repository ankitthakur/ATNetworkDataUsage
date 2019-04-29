//
//  NetworkDataInfo.swift
//  ATNetworkDataUsage
//
//  Created by Ankit Thakur on 29/04/19.
//

import Foundation
import CoreTelephony
import SystemConfiguration.CaptiveNetwork

class NetworkDataInfo {

    static func networkInfo() -> [NetworkTraffic] {

        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        var networkTraffics: [NetworkTraffic] = []

        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {

                var networkTraffic = NetworkTraffic()
                var trafficName: NetworkTrafficName = .none
                var ssid: String = ""
                var carrierName: String = ""

                let flags = Int32((ptr?.pointee.ifa_flags)!)
                let  addr = ptr?.pointee.ifa_addr.pointee

                // Check for running IPv4, IPv6 interfaces. Skip the loopback interface.
                if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                    if addr?.sa_family == UInt8(AF_LINK) {
                        // Convert interface address to a human readable string:
                        let name = ptr?.pointee.ifa_name
                        let ifname = String.init(cString: name!)
                        var networkData: UnsafeMutablePointer<if_data>
                        networkData  = unsafeBitCast(ptr!.pointee.ifa_data,
                                                     to: UnsafeMutablePointer<if_data>.self)
                        print("\(type(of: self)) -> Function: \(#function) -> ifname prefix is \(ifname)")
//                        print("\(type(of: self)) -> Function: \(#function) -> Reachability connection is \(ReachabilityManager.shared.reachability.connection)")


                        if ifname.hasPrefix(NetworkInterface.prefixWifi) ||
                            ifname.hasPrefix(NetworkInterface.prefixCellular) ||
                            ifname.hasPrefix(NetworkInterface.prefixVPN) {

                            if Double(networkData.pointee.ifi_ibytes) > 0 ||
                                Double(networkData.pointee.ifi_obytes) > 0 {

                                trafficName = NetworkTrafficName(rawValue: ifname) ?? .none
                                ssid = getWiFiSsid() ?? ""
                                if let name = CTTelephonyNetworkInfo().subscriberCellularProvider?.carrierName {
                                    carrierName = name
                                    print("\(type(of: self)) -> Function: \(#function) -> carrierName is \(carrierName)")
                                }
                                var reachabilityConnection: NetworkTrafficName = .none

//                                if (ReachabilityManager.shared.reachability.connection == .wifi){
//                                    reachabilityConnection = .wifi
//                                }
//                                else if (ReachabilityManager.shared.reachability.connection == .cellular){
//                                    reachabilityConnection = .mobile
//                                }

                                networkTraffic.updateInfo(name: trafficName,
                                                          recieved: Double(networkData.pointee.ifi_ibytes),
                                                          sent: Double(networkData.pointee.ifi_obytes),
                                                          ssid: ssid,
                                                          carrierName: carrierName,
                                                          reachabilityConn: reachabilityConnection)

                                networkTraffics.append(networkTraffic)
                            }
                        }


                    }
                }
                ptr = ptr?.pointee.ifa_next
            }
        }
        freeifaddrs(ifaddr)

        return networkTraffics
    }

    private static func getWiFiSsid() -> String? {
        var ssid: String?
        let interfaces = CNCopySupportedInterfaces()
        if interfaces != nil {
            if let interfaceArray = interfaces as? [String] {
                if interfaceArray.count > 0 {
                    let interfaceName = interfaceArray.first!
                    if let unsafeInterfaceData = CNCopyCurrentNetworkInfo(interfaceName as CFString) {
                        if let interfaceData = unsafeInterfaceData as? [String: AnyObject] {
                            print(("carrier wifi ssid dict : \(interfaceData)"))
                            ssid = interfaceData["SSID"] as? String
                        }
                    }
                }
            }
        }
        return ssid
    }
}
