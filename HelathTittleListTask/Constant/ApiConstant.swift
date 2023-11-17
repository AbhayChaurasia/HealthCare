//
//  ApiConstant.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 17/11/23.
//

import Foundation
import UIKit
import SystemConfiguration
import SystemConfiguration.CaptiveNetwork

let url = "https://health.gov/myhealthfinder/api/v3/itemlist.json?Type=topic"
let alertTitle =  "No Internet Connection"
let alertDescription = "Unable to download the data. Looks like there is no internet connection."

//class NetworkStatus: NSObject {
//
//    static let sharedInstance = NetworkStatus()
//
//    //Function to check that if wifi is enabled and connected to any ssid or not
//    func hasConnectivity() -> Bool {
//
//        let reachability: Reachability = Reachability.forInternetConnection()
//        let networkStatus: Int = reachability.currentReachabilityStatus().rawValue
//        return networkStatus != 0
//
//    }
//
//}
