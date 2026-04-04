//
//  Network.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 12/20/24.
//

import Foundation


func getAppVersion() -> String {
    #if os(Linux)
    return "1.9"
    #else
    if let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
        return appVersion
    }
    return "Unknown"
    #endif
}

func getBuildNumber() -> String {
    #if os(Linux)
    return "14"
    #else
    if let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
        return buildNumber
    }
    return "Unknown"
    #endif
}
