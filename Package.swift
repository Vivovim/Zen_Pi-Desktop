// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift Package Manager required to build this package.

import PackageDescription

let package = Package(
    name: "ZenPi",
    platforms: [
        .macOS(.v13)
    ],
    targets: [
        .executableTarget(
            name: "ZenPi",
            path: "Testing",
            exclude: [
                "Assets.xcassets",
                "Preview Content",
                "Testing.entitlements",
            ]
        )
    ]
)
