//
//  Network.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 12/20/24.
//

import Foundation

/// Shared version constants for cross-platform consistency.
/// Update these values when releasing a new version.
private let zenPiVersion = "1.9"
private let zenPiBuild = "14"

func getAppVersion() -> String {
    #if os(Linux)
    return zenPiVersion
    #else
    if let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
        return appVersion
    }
    return zenPiVersion
    #endif
}

func getBuildNumber() -> String {
    #if os(Linux)
    return zenPiBuild
    #else
    if let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
        return buildNumber
    }
    return zenPiBuild
    #endif
}
