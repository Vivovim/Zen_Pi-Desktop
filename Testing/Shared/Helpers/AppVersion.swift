//
//  Network.swift
//  Zen Pi
//
//  Created by Christopher Huffaker on 12/20/24.
//

import Foundation
import SwiftUI


func getAppVersion() -> String {
      if let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
          return appVersion
      }
      return "Unknown"
  }

  func getBuildNumber() -> String {
      if let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
          return buildNumber
      }
      return "Unknown"
  }
